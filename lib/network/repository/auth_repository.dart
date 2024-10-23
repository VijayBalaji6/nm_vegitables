import 'package:shopping_app/network/services/auth_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<User?> checkIsUserLoggedIn();
  Future<void> createUserGetOtp({
    required String phoneNumber,
  });
  Future<void> loginUserGetOtp({
    required String phoneNumber,
  });
  Future<void> loginWithOtp({
    required String phoneNumber,
    required String token,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<void> createUserGetOtp({required String phoneNumber}) async {
    await AuthService.getOtpForSignIn(phoneNumber);
  }

  @override
  Future<void> loginUserGetOtp({
    required String phoneNumber,
  }) async {
    await AuthService.getOtpForLogin(phoneNumber);
  }

  @override
  Future<void> loginWithOtp({
    required String phoneNumber,
    required String token,
  }) async {
    await AuthService.loginWithOtp(token: token, phone: phoneNumber);
  }

  @override
  Future<User?> checkIsUserLoggedIn() async {
    return await AuthService.checkAuth();
  }
}
