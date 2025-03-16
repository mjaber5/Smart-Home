import 'package:flutter/material.dart';
import 'package:smart_home/features/home/presentation/view/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DashboardViewBody());
  }
}
