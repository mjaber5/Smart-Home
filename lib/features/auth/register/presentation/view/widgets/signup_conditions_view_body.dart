import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class ConditionsViewBody extends StatelessWidget {
  const ConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (bool? newValue) {},
            checkColor: IColors.kPrimaryColor,
            fillColor: WidgetStateProperty.all(IColors.kSeconderyColor),
          ),
          const Text(
            "I agree to ",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 13,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const Text(
            " and ",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "Terms of use",
              style: TextStyle(
                fontSize: 13,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
