import 'package:go_router/go_router.dart';
import 'package:smart_home/features/auth/register/presentation/view/signup_view.dart';
import 'package:smart_home/features/auth/signin/presentation/view/login_view.dart';
import 'package:smart_home/features/home/presentation/view/dashboard_view.dart';
import 'package:smart_home/features/home/presentation/view/energy_view.dart';
import 'package:smart_home/features/home/presentation/view/entertainment_view.dart';
import 'package:smart_home/features/home/presentation/view/home_view.dart';
import 'package:smart_home/features/home/presentation/view/security_view.dart';
import 'package:smart_home/features/home/presentation/view/water_view.dart';
import 'package:smart_home/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kSigninView = '/signinView';
  static const kRegersiterView = '/regersiterView';
  static const kLayout = '/layoutApp';
  static const kWalletView = '/walletView';
  static const kHomeView = '/homeView';
  static const kNotificationView = '/notificationView';
  static const kProfileView = '/profileView';
  static const kEnergyView = '/energyView';
  static const kEntertainmentView = '/entertainmentView';
  static const kWaterView = '/waterView';
  static const kDashboardView = '/dashboardView';
  static const kSecurityView = '/securityView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kSigninView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegersiterView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kEnergyView,
        builder: (context, state) => const EnergyView(),
      ),
      GoRoute(
        path: kEntertainmentView,
        builder: (context, state) => const EntertainmentView(),
      ),
      GoRoute(path: kWaterView, builder: (context, state) => const WaterView()),
      GoRoute(
        path: kDashboardView,
        builder: (context, state) => DashboardView(),
      ),
      GoRoute(path: kSecurityView, builder: (context, state) => SecurityView()),
    ],
  );
}
