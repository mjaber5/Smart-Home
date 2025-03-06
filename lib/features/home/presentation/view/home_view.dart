import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';
import 'package:smart_home/features/home/presentation/view/temperature.dart';
import 'package:smart_home/features/home/presentation/view/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context: context), // ✅ Added drawer
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HI Mohammed',
                    style: TextStyle(
                      fontSize: 18,
                      color: IColors.kSeconderyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return InkWell(
                        onTap: () {
                          Scaffold.of(
                            context,
                          ).openDrawer(); // ✅ This will now work
                        },
                        child: RotatedBox(
                          quarterTurns: 135,
                          child: Icon(
                            Icons.bar_chart_rounded,
                            color: IColors.kSeconderyColor,
                            size: 28,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 32),
                    Center(child: WeatherContainer()),
                    const SizedBox(height: 16),

                    const SizedBox(height: 48),
                    const Text(
                      'SERVICES',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                          icon: 'assets/images/energy.png',
                          title: 'ENERGY',
                        ),
                        _cardMenu(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TemperaturePage(),
                              ),
                            );
                          },
                          icon: 'assets/images/temperature.png',
                          title: 'TEMPERATURE',
                          color: IColors.kSeconderyColor,
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                          icon: 'assets/images/water.png',
                          title: 'WATER',
                        ),
                        _cardMenu(
                          icon: 'assets/images/entertainment.png',
                          title: 'ENTERTAINMENT',
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 36),
        width: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image.asset(icon),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        color: IColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          'Weather Container',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
