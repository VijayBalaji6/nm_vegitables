import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/modules/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/modules/splash/bloc/splash_bloc.dart';
import 'package:shopping_app/network/repository/auth_repository.dart';
import 'package:shopping_app/utils/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setting application to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  String supaBaseKey =
      await rootBundle.loadString('assets/supa_base_key/supa_base_key.json');
  Map<String, dynamic> supaBaseKeysData = json.decode(supaBaseKey);
  await Supabase.initialize(
    url: supaBaseKeysData['apiUrl'],
    anonKey: supaBaseKeysData['apiKey'],
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthRepository authRepository = AuthRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
            create: (BuildContext context) =>
                SplashBloc(authRepository: authRepository)
                  ..add(CheckIsUserRegisteredEvent())),
        BlocProvider<AuthBloc>(
            create: (BuildContext context) =>
                AuthBloc(authRepository: authRepository)),
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
