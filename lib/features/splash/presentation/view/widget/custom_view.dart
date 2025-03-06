import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/color.dart';

class CustomView extends StatefulWidget {
  const CustomView({super.key});

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _movementAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _movementAnimation = Tween<double>(
      begin: -0.1,
      end: 0.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            _buildAnimatedCircle(
              alignment: AlignmentDirectional(
                2.7 + _movementAnimation.value,
                -1.2,
              ),
              sizeFactor: 1.3,
            ),
            _buildAnimatedCircle(
              alignment: AlignmentDirectional(
                -2.7 - _movementAnimation.value,
                -1.2,
              ),
              sizeFactor: 1.3,
            ),
            _buildAnimatedCircle(
              alignment: AlignmentDirectional(20, -1.2),
              sizeFactor: 1.0,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
              child: Container(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAnimatedCircle({
    required AlignmentDirectional alignment,
    required double sizeFactor,
  }) {
    return Align(
      alignment: alignment,
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: Container(
          height: MediaQuery.of(context).size.width / sizeFactor,
          width: MediaQuery.of(context).size.width / sizeFactor,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: IColors.kSeconderyColor,
          ),
        ),
      ),
    );
  }
}
