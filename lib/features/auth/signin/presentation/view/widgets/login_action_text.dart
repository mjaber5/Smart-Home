import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class LoginActionText extends StatelessWidget {
  const LoginActionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                checkColor: IColors.kPrimaryColor,
                fillColor: WidgetStateProperty.all(IColors.kSeconderyColor),
              ),
              const Text(
                'Remember Me',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: IColors.kSeconderyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
