import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/utils/app_router.dart';
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
                      color: IColors.kFourthColor,
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
                            color: IColors.kFourthColor,
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
                          icon: 'assets/icons/7.png',
                          title: 'ENERGY',
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kEnergyView);
                          },
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
                          icon: 'assets/icons/8.png',
                          title: 'TEMPERATURE',
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(icon: 'assets/icons/9.png', title: 'WATER'),
                        _cardMenu(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push(AppRouter.kEntertainmentView);
                          },
                          icon: 'assets/icons/10.png',
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
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 36),
        width: 156,
        decoration: BoxDecoration(
          color: IColors.kSeconderyColor.withAlpha(50),
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
        color: IColors.kSeconderyColor.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CloudAnimation()],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '13°C',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Sunny',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CloudAnimation extends StatefulWidget {
  const CloudAnimation({super.key});

  @override
  State<CloudAnimation> createState() => _CloudAnimationState();
}

class _CloudAnimationState extends State<CloudAnimation>
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
          child: Image.asset('assets/icons/3.png', width: 190),
        ),
      ],
    );
  }
}
