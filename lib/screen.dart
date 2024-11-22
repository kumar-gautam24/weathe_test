

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'services/rep/weather_api.dart';
import 'models/model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherscreenState createState() => _WeatherscreenState();
}

class _WeatherscreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService(apiUrl: dotenv.env['apikey']!);
  WeatherData? _weatherData;
  bool loading = false;
  String errorMessage = '';

  void fetchWeather() async {
    setState(() {
      loading = true;
      errorMessage = '';
    });

    try {
      final data = await _weatherService.fetchWeather();
      setState(() {
        _weatherData = data;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading) const CircularProgressIndicator(),
            if (errorMessage.isNotEmpty)
              Text(errorMessage, style: const TextStyle(color: Colors.red)),
            if (_weatherData != null) ...[
              Text("Country: ${_weatherData!.location!.country!}"),
              Text("Weather: ${_weatherData!.current!.condition!.text!}"),
            ],
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text("Reload"),
            ),
          ],
        ),
      ),
    );
  }
}
