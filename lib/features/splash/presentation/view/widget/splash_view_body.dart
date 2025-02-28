import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:smart_home/core/utils/app_router.dart';
import 'package:smart_home/features/splash/presentation/view/widget/custom_view.dart';
import 'package:smart_home/features/splash/presentation/view/widget/splash_app_logo.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).pushReplacement(AppRouter.kSigninView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CustomView(), SplashAppLogo()],
      ),
    );
  }
}
