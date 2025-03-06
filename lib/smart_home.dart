import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/core/utils/app_router.dart';
import 'package:smart_home/core/utils/color.dart';

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar color to match app background
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: IColors.kPrimaryColor),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
