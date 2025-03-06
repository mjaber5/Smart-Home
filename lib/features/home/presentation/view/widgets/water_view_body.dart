import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class WaterViewBody extends StatefulWidget {
  const WaterViewBody({super.key});

  @override
  State<WaterViewBody> createState() => _WaterViewBodyState();
}

class _WaterViewBodyState extends State<WaterViewBody>
    with SingleTickerProviderStateMixin {
  bool isFlowOn = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleFlow() {
    setState(() {
      isFlowOn = !isFlowOn;
      if (isFlowOn) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            // Header Section with Navigation
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: IColors.kSeconderyColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Water Management',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Water Tank Level Section
            AnimatedContainer(
              width: double.infinity,
              height: 220,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: IColors.kFourthColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.blueGrey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Water Tank Level",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: IColors.kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 10,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                          ),
                          backgroundColor: Colors.blue[100],
                        ),
                      ),
                      Text(
                        "75%",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: IColors.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Daily Water Usage Stats with Animation
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.green.withOpacity(0.2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Daily Water Usage",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.water_drop, size: 30, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        "12 Liters",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.6, // Simulate 60% usage
                      child: Container(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Water Flow Control Section with Toggle
            GestureDetector(
              onTap: toggleFlow,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isFlowOn ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animation,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12),
                    Text(
                      isFlowOn ? "Water Flow ON" : "Water Flow OFF",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
