## 🌐 Our Website  
[https://gadlee.github.io/](https://gadlee.github.io/)  
<img src="https://github.com/user-attachments/assets/1f6fb968-30be-4282-a776-c33a048aa27e" alt="FarmerAI Website Screenshot" width="150" />

---

## 🚜 The Application  
[https://farmerai-2ch4.onrender.com/](https://farmerai-2ch4.onrender.com/)  
<img src="https://github.com/user-attachments/assets/4ba80e07-1cc9-4e05-905f-3576d46c2683" alt="FarmerAI Application Screenshot" width="150" />

**FarmAI: Empowering Ugandan Farmers with AI-Driven Market Intelligence**
...

***Overview***
FarmAI is a mobile application designed to support Ugandan smallholder farmers by providing data-driven market insights through AI-powered predictions, personalized crop dashboards, and real-time notifications. Built with Flutter for the front-end and Firebase for backend services, it addresses challenges like limited market access and reliance on middlemen, enabling farmers to optimize planting, harvesting, and selling decisions for crops like maize, coffee, and beans.
Features

AI-Powered Market Prediction: Forecasts crop prices, optimal planting/harvesting times, and regional demand using Prophet, LSTM, and classification models with data from UBOS, FAO, and World Bank.
Localized News Aggregation: Summarizes agricultural news from MAAIF, trade reports, and weather bulletins using NLP for farmer-friendly updates.
Personalized Crop Dashboard: Offers tailored insights on planting times, selling periods, and price ranges for selected crops, with historical data visualizations.
Push Notifications: Alerts farmers to market changes, government policies, and optimal selling windows via Firebase.

---
***Installation***

Clone the repository: git clone https://github.com/IANSEZI/FarmerAI.git
Install Flutter: Follow instructions at flutter.dev
Set up Firebase: Configure Firebase project and add google-services.json to /android/app
Install dependencies: Run flutter pub get
Run the app: Use flutter run on a connected device or emulator

---
***Usage***

Farmers select crops to receive tailored insights.
View predictions and news summaries on the dashboard.
Receive push notifications for market and policy updates.

---
***Future Work***

Pilot testing with farmers for feedback.
Expand crop database and multilingual support.
Enhance offline capabilities and scalability.

 ---
 **RUNNING THE CODE IN FLUTLAB (easier)**

1. Go to https://flutlab.io/
2. Sign in or create a free account.
3. On your FlutLab dashboard, click New Project.
4. Choose Import Project.
5. Select Import from Git.
6. Paste the GitHub repository URL: https://github.com/IANSEZI/FarmerAI.git
7. Click Create Project.
8. FlutLab will automatically download your repo.
9. Your files will appear in the FlutLab file explorer.
10. Open pubspec.yaml in FlutLab.
11. Click Pub Get (top bar) to install all dependencies (provider, font_awesome_flutter, etc.).
12. Click the green Run button.
13. Wait for the build to complete.
14. Use the built-in emulator viewer to interact with the app.
15. If you get a package not found error, re-run Pub Get.
16. Check that all dependencies are listed correctly in pubspec.yaml.


## Getting Started: FlutLab - Flutter Online IDE

- How to use FlutLab? Please, view our https://flutlab.io/docs
- Join the discussion and conversation on https://flutlab.io/residents

Farmer AI Mobile Application
An interactive Flutter mobile app using AI and climate data to help Ugandan farmers make data-driven decisions on planting, storing, and selling their produce.

Features
•	User authentication (Sign Up / Login)
•	Dynamic dashboard with crop-specific insights
•	Weather predictions with color-coded recommendations
•	Market and price prediction placeholders
•	Crop-specific news with professional advice
•	Notifications system
•	Favorites/bookmarking feature
•	Fully customizable settings (dark mode, theme colors, font sizes, fonts)
•	Contact Us pop-up with social media and communication links

Tech Stack
•	Flutter (Dart)
•	Firebase (authentication & future database integration)
•	Provider (state management)
•	FontAwesome (icons)
•	Google Fonts (dynamic fonts)
•	ML Model Placeholder (to be integrated)

Getting Started
1. Clone the repository
git clone 

2. Install dependencies
Using Flutter:
flutter pub get

3. Run the app
For mobile:
flutter run
For web (if building a web interface):
flutter run -d chrome

Environment setup
1.	Flutter SDK (>=3.0)
2.	Firebase Project
o	Initialize Firebase in your app if using authentication and Firestore.
o	Uncomment Firebase.initializeApp() in main.dart after setup.

Project Structure
lib/
 ┣ screens/
 ┃ ┣ login_screen.dart
 ┃ ┣ signup_screen.dart
 ┃ ┣ home_screen.dart
 ┃ ┣ crop_dashboard_screen.dart
 ┃ ┣ settings_screen.dart
 ┃ ┗ ...
 ┣ widgets/
 ┃ ┣ contact_floating.dart
 ┃ ┣ top_icons.dart
 ┃ ┗ ...
 ┣ models/
 ┗ main.dart
assets/
 ┣ images/
 ┃ ┣ signup_bg.jpg
 ┃ ┣ pest_outbreak.jpg
 ┃ ┗ ...
pubspec.yaml
            
