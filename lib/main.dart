import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/modules/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/modules/splash/bloc/splash_bloc.dart';
import 'package:shopping_app/service_locator.dart';
import 'package:shopping_app/utils/config/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setting application to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setupServiceLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
            create: (BuildContext context) =>
                SplashBloc()..add(CheckIsUserRegisteredEvent())),
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: false,
        child: MaterialApp.router(
          routerConfig: AppRouter.appRoutes,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: false,
          ),
        ),
      ),
    );
  }
}
