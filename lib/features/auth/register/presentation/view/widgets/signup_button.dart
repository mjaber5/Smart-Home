import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/utils/app_router.dart';
import 'package:smart_home/core/utils/color.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: 335,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: IColors.kSeconderyColor,
                disabledBackgroundColor: Colors.grey,
                disabledForegroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 18),
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kLayout);
              },
              child: const Text('Sign up'),
            ),
          ),
        ],
      ),
    );
  }
}
