import 'package:flutter/material.dart';
import 'package:smart_home/features/home/presentation/view/widgets/water_view_body.dart';

class WaterView extends StatelessWidget {
  const WaterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WaterViewBody());
  }
}
