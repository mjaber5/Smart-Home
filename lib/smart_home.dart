import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_router.dart';
import 'package:smart_home/core/utils/color.dart';

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Flutter Smart Home App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: IColors.kPrimaryColor),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
