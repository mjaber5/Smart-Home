import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class SplashAppLogo extends StatefulWidget {
  const SplashAppLogo({super.key});

  @override
  State<SplashAppLogo> createState() => _SplashAppLogoState();
}

class _SplashAppLogoState extends State<SplashAppLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageSlideAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Image starts off-screen, above
      end: Offset.zero, // Image ends in the center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Text starts off-screen, below
      end: Offset.zero, // Text ends in the center, under the image
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(); // Start the animation when the widget is initialized
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose the animation controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Animated image with slide-in effect
          Center(
            child: SlideTransition(
              position: _imageSlideAnimation,
              child: Image.asset('assets/icons/1.png', width: 300),
            ),
          ),
          // Animated text with slide-in effect
          SlideTransition(
            position: _textSlideAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'D',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: IColors.kFourthColor,
                  ),
                ),
                Text(
                  'igital Home',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
