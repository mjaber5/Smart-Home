import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class SplashAppLogo extends StatelessWidget {
  const SplashAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/smart-house.png',
            height: 150,
            width: 150,
            color: IColors.kFourthColor,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'D',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: IColors.kFourthColor,
                  ),
                ),
                Text(
                  'igital Home',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
