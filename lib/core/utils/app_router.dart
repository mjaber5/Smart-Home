import 'package:go_router/go_router.dart';
import 'package:smart_home/features/auth/register/presentation/view/signup_view.dart';
import 'package:smart_home/features/auth/signin/presentation/view/login_view.dart';
import 'package:smart_home/features/home/presentation/view/home_view.dart';
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
    ],
  );
}
