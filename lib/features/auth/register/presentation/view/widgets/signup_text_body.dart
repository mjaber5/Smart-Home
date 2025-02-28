import 'package:flutter/material.dart';

class SignupTextBody extends StatelessWidget {
  const SignupTextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 42.0, bottom: 16, left: 14),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            "Let’s create your account",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
