Our Website: https://gadlee.github.io/
<img src="https://github.com/user-attachments/assets/1f6fb968-30be-4282-a776-c33a048aa27e" alt="FarmerAI Website (1)" width="200"/>

The application: https://farmerai-2ch4.onrender.com/
<img src="https://github.com/user-attachments/assets/4ba80e07-1cc9-4e05-905f-3576d46c2683" alt="Link to FarmerAI Application" width="200"/>


 
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

**The rest of the readme file**

# Farmai

A new Flutter project created with FlutLab - https://flutlab.io

## Getting Started

A few resources to get you started if this is your first Flutter project:

- https://flutter.dev/docs/get-started/codelab
- https://flutter.dev/docs/cookbook

For help getting started with Flutter,
https://flutter.dev/docs, which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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
git clone https://github.com/IANSEZI/FarmerAI.git

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
            
