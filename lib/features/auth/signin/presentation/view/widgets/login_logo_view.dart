import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class LoginLogoView extends StatelessWidget {
  const LoginLogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'NH',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: IColors.kSeconderyColor,
                ),
              ),
              Icon(Icons.home, size: 50, color: IColors.kSeconderyColor),
            ],
          ),

          const SizedBox(height: 12),
          const Text(
            'Welcome back,',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'Discover Limitiess Choices and Unmatched Convenience.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
