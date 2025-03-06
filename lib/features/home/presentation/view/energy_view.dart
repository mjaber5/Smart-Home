import 'package:flutter/material.dart';
import 'package:smart_home/features/home/presentation/view/widgets/energy_view_body.dart';

class EnergyView extends StatelessWidget {
  const EnergyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EnergyViewBody());
  }
}
