import 'package:shopping_app/network/services/auth_services.dart';
import 'package:shopping_app/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  User? checkIsUserLoggedIn();
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

  final AuthServiceRepository _authService = sl<AuthServiceRepository>();

  @override
  Future<void> createUserGetOtp({required String phoneNumber}) async {
    try {
      await _authService.getOtpForSignIn(phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> loginUserGetOtp({
    required String phoneNumber,
  }) async {
    try {
      await _authService.getOtpForLogin(phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> loginWithOtp({
    required String phoneNumber,
    required String token,
  }) async {
    try {
      await _authService.loginWithOtp(token: token, phone: phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  @override
  User? checkIsUserLoggedIn() {
    try {
      return _authService.checkAuth();
    } catch (e) {
      rethrow;
    }
  }
}
