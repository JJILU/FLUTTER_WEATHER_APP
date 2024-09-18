# Flutter Weather App

A simple weather app built using Flutter. The app allows users to enter the name of a city and fetch the current weather information, including temperature, weather condition, current city time, and an icon representing the weather. It uses the OpenWeatherMap API to fetch real-time weather data.

## Features

- Single-screen app with a clean and minimal design
- Text input field to enter the name of a city
- "Get Weather" `FloatingActionButton` to fetch the current weather for the entered city
- Displays weather information:
  - City name
  - Current city time
  - Temperature (in Celsius)
  - Weather description
  - Weather icon representing the condition
- Loading indicator while fetching weather data
- Error handling for invalid city names or network issues
- Basic state management using `setState`
- Responsive UI for different screen sizes
- Option to search for another city's weather via a `showDialog` input field

## Requirements

- Flutter SDK
- OpenWeatherMap API key (Sign up for a free API key at [OpenWeatherMap](https://openweathermap.org/))

## Installation

1. Clone this repository:
    ```bash
    git clone https://github.com/yourusername/flutter-weather-app.git
    ```

2. Navigate to the project directory:
    ```bash
    cd flutter-weather-app
    ```

3. Install dependencies:
    ```bash
    flutter pub get
    ```

4. Set up your OpenWeatherMap API key:
    - Open the `consts.dart` file.
    - Replace `your_api_key_here` with your actual API key in the `OPENWEATHER_API_KEY` variable.

5. Run the app on an emulator or physical device:
    ```bash
    flutter run
    ```

## Usage

1. Enter the name of a city in the text input field on the main screen.
2. Press the "Get Weather" `FloatingActionButton` to fetch the weather data.
3. The app will display the following information:
   - City name
   - Current city time
   - Temperature (in Celsius)
   - Weather description (e.g., clear sky, rain)
   - An icon representing the weather condition
4. If an invalid city name is entered or there is a network issue, an error message will be displayed.
5. To search for another city, click the "Get Weather" button again, and a `showDialog` will appear to allow you to enter a new city or cancel the search.

## API Integration

- The app integrates with the [OpenWeatherMap API](https://openweathermap.org/) to fetch weather data in real-time.
- Weather data includes:
  - City name
  - Current city time
  - Current temperature (in Celsius)
  - Weather condition description (e.g., sunny, rainy)
  - An icon representing the weather condition

## Code Structure

- **`home_page.dart`**: Contains all the logic for fetching weather data and updating the UI.
- **`consts.dart`**: Stores the OpenWeatherMap API key in the `OPENWEATHER_API_KEY` variable, which is referenced in `home_page.dart`.

## State Management

- The app uses `setState` to manage the following states:
  - **Loading State**: Displays a loading indicator while the app fetches weather data.
  - **Error State**: Shows an error message if an invalid city name is entered or if there is a network issue.
  - **Data State**: Displays the weather data when successfully fetched.

## Error Handling

- The app handles the following errors:
  - Invalid city name: Displays an error message if the user enters a city that does not exist.
  - Network issues: Displays an error message if there is a problem connecting to the weather API.

## Responsive UI

- The user interface is designed to be responsive and adapts to different screen sizes.

## Screenshots

### Main Screen
![Main Screen](https://via.placeholder.com/400x800.png?text=Main+Screen)

### Weather Display
![Weather Display](https://via.placeholder.com/400x800.png?text=Weather+Data)

### City Search Dialog
![City Search Dialog](https://via.placeholder.com/400x800.png?text=City+Search+Dialog)

## Flutter Best Practices

- All logic is stored in `home_page.dart` to keep the codebase simple and focused.
- The API key is managed separately in `consts.dart` to ensure secure and easy management.
- Follows Flutter best practices for asynchronous API calls, state management, and responsive design.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [OpenWeatherMap API](https://openweathermap.org/) for providing free weather data.
