import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/modules/auth/views/otp_screen.dart';
import 'package:shopping_app/modules/auth/views/phone_number_screen.dart';
import 'package:shopping_app/modules/splash/views/splash_screen.dart';
import 'package:shopping_app/utils/config/routes/app_routes.dart';
import 'package:shopping_app/widgets/error_route_screen.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRoutes = GoRouter(
    navigatorKey: routerKey,
    initialLocation: '/splash',
    errorBuilder: (context, state) => ErrorRouteScreen(errorState: state),
    routes: [
      GoRoute(
        name: AppRoutes.splashScreen,
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.phoneNumberScreen,
        path: '/phoneNumberScreen',
        builder: (context, state) => PhoneNumberScreen(),
      ),
      GoRoute(
        name: AppRoutes.otpScreen,
        path: '/otpScreen',
        builder: (context, state) => OtpScreen(),
      ),
    ],
  );
}
