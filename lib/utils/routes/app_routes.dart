import 'package:go_router/go_router.dart';
import 'package:shopping_app/modules/auth/views/auth_screen.dart';
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
        name: AppRouteConstants.signInScreen,
        path: '/signIn',
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );
}
