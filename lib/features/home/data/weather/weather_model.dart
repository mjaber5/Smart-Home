class Weather {
  final String city;
  final double temperature;
  final String description;
  final String icon;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature:
          json['main']['temp'] - 273.15, // Convert from Kelvin to Celsius
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'city': city,
      'description': description,
    };
  }
}
