import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_home/features/home/data/weather/weather_model.dart';

class WeatherService {
  final String apiKey =
      "b55608bf7436ba84f880888d579c86f9"; // Replace with your OpenWeather API Key

  Future<Weather> fetchWeatherByCoords(double lat, double lon) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
