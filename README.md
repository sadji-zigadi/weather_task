# Weather Application Documentation

## Overview
This weather application provides users with real-time weather data by integrating with the OpenWeatherMap API. It’s built using Flutter and follows clean architecture principles to ensure a modular, scalable, and maintainable codebase.


https://github.com/user-attachments/assets/b7ef3e73-8e50-4d54-854c-4db0acd54aed



## Prerequisites
- **Flutter**: Ensure Flutter SDK is installed. [Download Flutter SDK](https://flutter.dev/docs/get-started/install)
- **OpenWeatherMap API Key**: You’ll need an API key from OpenWeatherMap. [Get API Key](https://home.openweathermap.org/users/sign_up)

## Installation Guide

### Step 1: Clone the Repository
```bash
git clone <your-repo-link>
cd <your-project-directory>
```

### Step 2: Install Dependencies
Navigate to your project directory and run:
```bash
flutter pub get
```

### Step 3: Configure Environment Variables
Create a `.env` file in the root of the project and add your OpenWeatherMap API key:
```plaintext
API_KEY=your_openweathermap_api_key
```

Add the `flutter_dotenv` package in `pubspec.yaml` to load environment variables.

### Step 4: Run the Application
Use the following command to run the application on your device or emulator:
```bash
flutter run
```

## Architecture Overview
This project follows **clean architecture** principles to separate business logic, presentation, and data layers. The project structure is organized as follows:

- **Domain Layer**: Contains the core business logic, including entities, repositories, and use cases.
- **Data Layer**: Manages data from the OpenWeatherMap API and other data sources, including models and data mappers.
- **Presentation Layer**: Contains the UI elements, including widgets and view models, using BLoC for state management.

## Key Functionalities

### 1. **Fetching Weather Data**
   - The application fetches real-time weather data from the OpenWeatherMap API based on the user’s location or a searched location.
   - Uses `WeatherRepository` to handle data retrieval and `WeatherCubit` for managing UI state.

### 2. **Displaying Weather Data**
   - Weather details, including temperature & descriptions, are displayed.
   - UI is designed to be responsive using ScreenUtil, ensuring optimal viewing on various device sizes.

### 3. **Error Handling**
   - Ensures graceful error handling for network issues or API call failures, with messages displayed to the user.

## Additional Notes
- **Responsiveness**: The UI leverages the `ScreenUtil` package to adapt elements for different screen sizes.


