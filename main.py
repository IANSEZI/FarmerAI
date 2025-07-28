from fastapi import FastAPI, Query
import joblib
from tensorflow.keras.models import load_model
import numpy as np
import os

app = FastAPI()

# Paths to saved models and data
RF_MODEL_PATH = os.path.join(os.path.dirname(__file__), 'random_forest_model.joblib')
LSTM_MODELS_DIR = os.path.join(os.path.dirname(__file__), 'lstm')

# Load Random Forest model
rf_model = joblib.load(RF_MODEL_PATH)
EXPECTED_RF_FEATURES = rf_model.n_features_in_

# LSTM input shape (example for maize)
lstm_input_timesteps = 12
lstm_input_features = 56

# Helper to load LSTM model for a commodity
lstm_models = {}
def get_lstm_model(commodity):
    model_path = os.path.join(LSTM_MODELS_DIR, f'lstm_model_{commodity}.h5')
    return load_model(model_path, compile=False)

# Human-readable output formatter
def format_prediction_output(crop=None, market=None, predicted_price=None, price_std=None, best_sell_month=None, confidence=None, recommendation=None):
    messages = []
    if crop:
        messages.append(f"Crop: {crop}")
    if market:
        messages.append(f"Market: {market}")
    if predicted_price is not None:
        price_str = f"{int(predicted_price):,} UGX"
        if price_std is not None:
            price_str += f" (± {int(price_std):,} UGX)"
        messages.append(f"Expected Price: {price_str}")
    if best_sell_month:
        messages.append(f"Best time to sell: {best_sell_month}")
    if confidence is not None:
        if confidence < 0.1:
            conf_str = "Confidence: High"
        elif confidence < 0.3:
            conf_str = "Confidence: Medium"
        else:
            conf_str = "Confidence: Low"
        messages.append(conf_str)
    if recommendation:
        messages.append(f"Recommendation: {recommendation}")
    return "\n".join(messages)

@app.get('/')
def root():
    return {'message': 'Uganda Farmer AI API is running!'}

@app.get('/predict_rf')
def predict_rf(crop: str = Query(...), market: str = Query(...), date: str = Query(...)):
    # Instead of looking up features, use dummy/default features
    features = np.ones(EXPECTED_RF_FEATURES).reshape(1, -1)  # All ones, shape matches model
    prediction = rf_model.predict(features)[0]
    confidence = 0.08  # Example confidence
    message = format_prediction_output(
        crop=crop,
        market=market,
        predicted_price=prediction,
        confidence=confidence,
        recommendation=f"Expected price for {crop} in {market} on {date} is {int(prediction):,} UGX."
    )
    return {"result": message}

@app.get('/predict_lstm')
def predict_lstm(commodity: str = Query(...), market: str = Query(...), date: str = Query(...)):
    # Use dummy time series features for LSTM
    features = np.ones((1, lstm_input_timesteps, lstm_input_features))
    model = get_lstm_model(commodity)
    prediction = model.predict(features).flatten()[0]
    confidence = 0.08  # Example confidence
    message = format_prediction_output(
        crop=commodity,
        market=market,
        predicted_price=prediction,
        best_sell_month=date,
        confidence=confidence,
        recommendation=f"Sell your {commodity} in {market} on {date} for the best price."
    )
    return {"result": message}

@app.get('/recommend_season')
def recommend_season(crop: str = Query(...)):
    # Simple rule-based recommendations for planting/harvesting windows
    crop_seasons = {
        'maize': {'planting': 'March-April, August-September', 'harvesting': 'July-August, December-January'},
        'beans': {'planting': 'March-April, September-October', 'harvesting': 'June-July, December-January'},
        'cassava': {'planting': 'Any month (rainy season preferred)', 'harvesting': '12-18 months after planting'},
        'rice': {'planting': 'April-May, September-October', 'harvesting': 'August-September, January-February'},
        # Add more crops as needed
    }
    crop_key = crop.lower()
    if crop_key in crop_seasons:
        return {
            'crop': crop,
            'recommended_planting': crop_seasons[crop_key]['planting'],
            'recommended_harvesting': crop_seasons[crop_key]['harvesting']
        }
    else:
        return {'error': f'No season data available for {crop}.'}

# Update region lists in endpoints to support more markets
all_markets = ['kampala', 'gulu', 'mbale', 'arua', 'masaka', 'mbarara', 'fort portal', 'soroti', 'jinja', 'hoima']

@app.get('/compare_regions')
def compare_regions(crop: str = Query(...), date: str = Query(...)):
    # Dummy logic: suggest best region based on hardcoded price trends
    region_prices = {
        'maize': {'kampala': 4000, 'gulu': 3500, 'mbale': 3700, 'arua': 3600, 'masaka': 3800, 'mbarara': 3900, 'fort portal': 3750, 'soroti': 3650, 'jinja': 3850, 'hoima': 3700},
        'beans': {'kampala': 5000, 'gulu': 4800, 'mbale': 4900, 'arua': 4700, 'masaka': 4950, 'mbarara': 5000, 'fort portal': 4850, 'soroti': 4750, 'jinja': 4900, 'hoima': 4800},
        'cassava': {'kampala': 2000, 'gulu': 2200, 'mbale': 2100},
        'rice': {'kampala': 6000, 'gulu': 5800, 'mbale': 5900},
        # Add more crops/regions as needed
    }
    crop_key = crop.lower()
    if crop_key in region_prices:
        best_region = max(region_prices[crop_key], key=region_prices[crop_key].get)
        best_price = region_prices[crop_key][best_region]
        return {
            'crop': crop,
            'date': date,
            'best_region': best_region,
            'expected_price': f'{best_price:,} UGX',
            'region_comparison': region_prices[crop_key]
        }
    else:
        return {'error': f'No region price data available for {crop}.'}

@app.get('/batch_predict_rf')
def batch_predict_rf(crops: str = Query(...), markets: str = Query(...), dates: str = Query(...)):
    # crops, markets, dates are comma-separated lists
    crop_list = [c.strip() for c in crops.split(',')]
    market_list = [m.strip() for m in markets.split(',')]
    date_list = [d.strip() for d in dates.split(',')]
    results = []
    for crop, market, date in zip(crop_list, market_list, date_list):
        features = np.ones(EXPECTED_RF_FEATURES).reshape(1, -1)
        prediction = rf_model.predict(features)[0]
        results.append({
            'crop': crop,
            'market': market,
            'date': date,
            'predicted_price': int(prediction)
        })
    return {'batch_results': results}

@app.get('/price_trend')
def price_trend(crop: str = Query(...), market: str = Query(...)):
    # Dummy historical price trend
    trends = {
        'maize': {'kampala': [3500, 3700, 3900, 4000]},
        'beans': {'kampala': [4800, 4900, 5000, 5100]},
        'cassava': {'kampala': [1800, 1900, 2000, 2100]},
        'rice': {'kampala': [5700, 5800, 6000, 6200]},
    }
    crop_key = crop.lower()
    market_key = market.lower()
    if crop_key in trends and market_key in trends[crop_key]:
        return {'crop': crop, 'market': market, 'price_trend': trends[crop_key][market_key]}
    else:
        return {'error': f'No price trend data for {crop} in {market}.'}

@app.get('/prediction_explanation')
def prediction_explanation(crop: str = Query(...), market: str = Query(...), date: str = Query(...)):
    # Dummy explanation
    return {
        'crop': crop,
        'market': market,
        'date': date,
        'confidence': 'High',
        'key_features': ['season', 'market', 'historical price'],
        'note': 'Prediction is based on dummy features for demonstration.'
    }

@app.get('/supported_crops_markets')
def supported_crops_markets():
    crops = [
        'basin', 'batteries', 'beans', 'cassava (fresh)', 'cassava flour', 'charcoal', 'exercise book (48 pages)',
        'firewood', 'fish (dry)', 'jerrycan (20 l)', 'jerrycan (5 l)', 'laundry soap', 'leafy vegetables',
        'maize (white)', 'maize flour', 'maize', 'milk (fresh)', 'millet flour', 'millet', 'mug (plastic)',
        'nails', 'oil (vegetable)', 'panga', 'pen', 'pencil', 'plantains', 'plate (plastic)', 'pole', 'rice',
        'rope', 'salt', 'sanitary pads', 'serving spoon', 'sorghum', 'torch', 'underwear', 'wooden mingle'
    ]
    return {'supported_crops': crops, 'supported_markets': all_markets}

@app.get('/model_info')
def model_info():
    return {
        'rf_model': {
            'type': 'Random Forest',
            'features': EXPECTED_RF_FEATURES,
            'status': 'Loaded',
        },
        'lstm_model': {
            'type': 'LSTM',
            'input_shape': [lstm_input_timesteps, lstm_input_features],
            'status': 'Loaded (per crop)',
        }
    }

@app.post('/report_error')
def report_error(error: str = Query(...), user: str = Query(None)):
    # Dummy error reporting
    return {'message': 'Error received. Thank you for your feedback!', 'error': error, 'user': user}

@app.get('/weather_forecast')
def weather_forecast(region: str = Query(...)):
    forecasts = {
        'kampala': 'Rainy season expected in March-April and September-October.',
        'gulu': 'Dry season expected in January-February and June-July.',
        'mbale': 'Moderate rainfall expected year-round.',
        'arua': 'Rainy season in April-May and October-November.',
        'masaka': 'Rainfall peaks in March-May and September-November.',
        'mbarara': 'Dry spells in June-August, rain in March-May.',
        'fort portal': 'Consistent rainfall, best for bananas.',
        'soroti': 'Rainy season in April-June and September-November.',
        'jinja': 'Rainfall peaks in April-May and October-November.',
        'hoima': 'Rainy season in March-May and September-November.'
    }
    region_key = region.lower()
    if region_key in forecasts:
        return {'region': region, 'forecast': forecasts[region_key]}
    else:
        return {'error': f'No weather data for {region}.'}
