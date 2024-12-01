import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/modules/splash/bloc/splash_bloc.dart';
import 'package:shopping_app/utils/config/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (BuildContext context, state) {
        if (state is RegisteredState) {
          context.goNamed(AppRoutes.homeScreen);
        } else if (state is UnRegisteredState) {
          context.goNamed(AppRoutes.phoneNumberScreen);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/images/splash/logo.svg',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'VILAICHOL',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Price of Freshness',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              const Text(
                'A Product Of',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
              const Text(
                'NM VEGETABLES',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
