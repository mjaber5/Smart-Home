import 'package:flutter/material.dart';

class WeatherAnimation extends StatefulWidget {
  final String weatherCondition; // sunny, rainy, cloudy, etc.
  const WeatherAnimation({super.key, required this.weatherCondition});

  @override
  State<WeatherAnimation> createState() => _WeatherAnimationState();
}

class _WeatherAnimationState extends State<WeatherAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _cloudAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _cloudAnimation = Tween<double>(
      begin: -5,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Returns the appropriate weather image based on the condition.
  String getWeatherImage() {
    switch (widget.weatherCondition.toLowerCase()) {
      case 'sunny':
        return 'assets/icons/3.png';
      case 'rainy':
        return 'assets/icons/12.png';
      case 'cloudy':
        return 'assets/icons/11.png';
      case 'stormy':
        return 'assets/icons/14.png';
      case 'snowy':
        return 'assets/icons/13.png';
      default:
        return 'assets/icons/3.png'; // Default image
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _cloudAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _cloudAnimation.value),
              child: child,
            );
          },
          child: Image.asset(
            getWeatherImage(),
            width: MediaQuery.sizeOf(context).width * 0.49,
          ),
        ),
      ],
    );
  }
}
