

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/model.dart';


class WeatherService {
  final String apiUrl;

  WeatherService({required this.apiUrl});

  Future<Weather_data?> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather_data.fromJson(json);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}