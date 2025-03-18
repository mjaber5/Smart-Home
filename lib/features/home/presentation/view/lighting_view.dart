import 'package:flutter/material.dart';
import 'package:smart_home/features/home/presentation/view/widgets/lighting_view_body.dart';

class LightingView extends StatelessWidget {
  const LightingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LightingViewBody());
  }
}
