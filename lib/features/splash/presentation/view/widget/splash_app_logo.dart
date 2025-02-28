import 'package:flutter/material.dart';

class SplashAppLogo extends StatelessWidget {
  const SplashAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            'NeuraHome',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
