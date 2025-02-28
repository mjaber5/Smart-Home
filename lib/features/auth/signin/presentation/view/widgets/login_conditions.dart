import 'package:flutter/material.dart';

class LoginConditions extends StatelessWidget {
  const LoginConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 32),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              'By logging, you agree to our Terms & Conditions and Privacy Policy',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
