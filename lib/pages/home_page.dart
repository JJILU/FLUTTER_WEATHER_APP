import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/consts.dart';
import 'package:flutter_weather_app/util/dialog_box.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String cityName = "";

  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  String? errorMessage;

  // Method to fetch weather for a given city name
  void getWeather() async {
    setState(() {
      cityName = _controller.text;
      errorMessage = null; // Reset error message on new request
      
    });

     

    if (cityName.isNotEmpty) {
      try {
        Weather w = await _wf.currentWeatherByCityName(cityName);
        setState(() {
          if (w.areaName != null) {
            _weather = w;
          } else {
            errorMessage = "No data found for the entered city.";
            print(errorMessage);
          }
        });
      } catch (e) {
        if (e.toString().contains('404')) {
          setState(() {
            errorMessage = "City not found. Please enter a valid city name. ";
            print(errorMessage);
          });
        } else {
          setState(() {
            errorMessage = "Network issue. Please try again later.";
            print(errorMessage);
          });
        }
      }
    }

  }

  // Show dialog to enter new city
  void getNewCityWeather() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onGetWeather: getWeather,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _weather == null && errorMessage == null
          ? _buildUI()
          : _weatherDataContent(),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Please enter a city name and press 'Get Weather'.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter City",
                labelStyle: TextStyle(
                  fontSize: 16,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            FilledButton(
              onPressed: getWeather,
              child: const Text("Get Weather"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weatherDataContent() {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              )
            else ...[
              _locationHeader(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
              _dateTimeInfos(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              _weatherIcon(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              _currentTemp(),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getNewCityWeather,
        label: const Text("Get Weather"),
      ),
    );
  }

  Widget _locationHeader() {
    return Text(
      _weather?.areaName ?? "",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _dateTimeInfos() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png",
              ),
            ),
          ),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: const TextStyle(fontSize: 30),
    );
  }
}
