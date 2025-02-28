import 'package:flutter/material.dart';

class SignupTextFormFeild extends StatelessWidget {
  const SignupTextFormFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/icons/user.png',
                scale: 22,
                color: Colors.grey[700],
              ),
              hintText: 'Name',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/icons/id-card.png',
                scale: 18,
                color: Colors.grey[700],
              ),
              hintText: 'ID-Number',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/icons/email-icon.png',
                scale: 18,
                color: Colors.grey[700],
              ),
              hintText: 'E-Mail',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/icons/telephone.png',
                scale: 22,
                color: Colors.grey[700],
              ),
              hintText: 'Phone Number',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/icons/password-icon.png',
                scale: 20,
                color: Colors.grey[700],
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
