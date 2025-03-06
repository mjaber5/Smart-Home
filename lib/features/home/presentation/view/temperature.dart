import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_home/core/utils/color.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  double heating = 12;
  double fan = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: IColors.kSeconderyColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Temperature Control',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 32),
                    CircularPercentIndicator(
                      radius: 180,
                      lineWidth: 14,
                      percent: heating / 30,
                      progressColor: IColors.kFourthColor.withAlpha(215),
                      center: Text(
                        '${heating.toInt()}°',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'TEMPERATURE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _roundedButton(title: 'GENERAL', isActive: true),
                        _roundedButton(title: 'SERVICES'),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _temperatureSlider(
                      'HEATING',
                      heating,
                      (value) => setState(() => heating = value),
                    ),
                    const SizedBox(height: 24),
                    _temperatureSlider(
                      'FAN SPEED',
                      fan,
                      (value) => setState(() => fan = value),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _fan(title: 'FAN 1', isActive: true),
                        _fan(title: 'FAN 2', isActive: true),
                        _fan(title: 'FAN 3'),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _temperatureSlider(
    String title,
    double value,
    Function(double) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: IColors.kSeconderyColor.withAlpha(30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Slider(
            value: value,
            onChanged: onChanged,
            max: 30,
            activeColor: IColors.kPrimaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('LOW'), Text('MID'), Text('HIGH')],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fan({required String title, bool isActive = false}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color:
                isActive
                    ? IColors.kSeconderyColor.withAlpha(40)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Image.asset(
            isActive ? 'assets/images/fan-2.png' : 'assets/images/fan-1.png',
            width: 60,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color:
                isActive
                    ? IColors.kFourthColor
                    : IColors.kSeconderyColor.withAlpha(150),
          ),
        ),
      ],
    );
  }

  Widget _roundedButton({required String title, bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      decoration: BoxDecoration(
        color:
            isActive
                ? IColors.kSeconderyColor.withAlpha(80)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.transparent),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : IColors.kFourthColor,
        ),
      ),
    );
  }
}
