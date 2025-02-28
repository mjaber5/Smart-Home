import 'package:flutter/material.dart';

class LoginTextFormFeilds extends StatefulWidget {
  const LoginTextFormFeilds({super.key});

  @override
  State<LoginTextFormFeilds> createState() => _LoginTextFormFeildsState();
}

class _LoginTextFormFeildsState extends State<LoginTextFormFeilds> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
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
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 18),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                'assets/icons/password-icon.png',
                scale: 22,
                color: Colors.grey[700],
                alignment: Alignment.center,
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
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                icon: isSecure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                color: Colors.grey[700],
              ),
            ),
            obscureText: isSecure,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
