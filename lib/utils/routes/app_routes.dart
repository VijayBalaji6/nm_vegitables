import 'package:go_router/go_router.dart';
import 'package:shopping_app/modules/auth/views/otp_screen.dart';
import 'package:shopping_app/modules/auth/views/phone_number_screen.dart';
import 'package:shopping_app/modules/splash/views/splash_screen.dart';
import 'package:shopping_app/utils/routes/app_route_constant.dart';
import 'package:shopping_app/widgets/error_route_screen.dart';

class AppRoutes {
  static final GoRouter appRoutes = GoRouter(
    initialLocation: '/splash',
    errorBuilder: (context, state) => ErrorRouteScreen(errorState: state),
    routes: [
      GoRoute(
        name: AppRouteConstants.splashScreen,
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.phoneNumberScreen,
        path: '/phoneNumberScreen',
        builder: (context, state) => const PhoneNumberScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.otpScreen,
        path: '/otpScreen',
        builder: (context, state) => const OtpScreen(),
      ),
    ],
  );
}
