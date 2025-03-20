import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_home/core/utils/color.dart';
import 'package:smart_home/features/home/data/weather/weather_model.dart';
import 'package:smart_home/features/home/presentation/view/widgets/cloud_animation.dart';
import 'package:smart_home/features/home/presentation/view_model/services/location_services.dart';
import 'package:smart_home/features/home/presentation/view_model/services/weather_services.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({super.key});

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  late Future<Weather> _weather;

  @override
  void initState() {
    super.initState();
    _weather = _getWeather();
  }

  Future<Weather> _getWeather() async {
    try {
      final location = await LocationService().getCurrentLocation();
      return WeatherService().fetchWeatherByCoords(
        location.latitude,
        location.longitude,
      );
    } catch (e) {
      return Future.error("Failed to load weather data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: _weather,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingState();
        } else if (snapshot.hasError) {
          return _buildErrorState();
        } else if (snapshot.hasData) {
          return _buildWeatherContainer(snapshot.data!);
        } else {
          return _buildErrorState();
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "Failed to load weather data",
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildWeatherContainer(Weather weather) {
    return Container(
      width: double.infinity,
      height: 222,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: IColors.kFourthColor.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${weather.temperature.toStringAsFixed(0)}°C",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: IColors.kPrimaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  weather.description,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                SizedBox(height: 8),
                Text(
                  weather.city,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [WeatherAnimation(weatherCondition: weather.description)],
          ),
        ],
      ),
    );
  }
}
