import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static final supabase = Supabase.instance.client;

  static Future<User?> checkAuth() async {
    final Session? session = supabase.auth.currentSession;

    if (session != null) {
      return supabase.auth.currentUser;
    } else {
      return null;
    }
  }

  static Future<bool> loginWithOtp(
      {required String token, required String phone}) async {
    try {
      await supabase.auth.verifyOTP(
        type: OtpType.sms,
        token: token,
        phone: phone,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> getOtpForSignIn(String phone) async {
    try {
      await supabase.auth.signInWithOtp(
        phone: phone,
        shouldCreateUser: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> getOtpForLogin(String phone) async {
    try {
      await supabase.auth.signInWithOtp(
        phone: phone,
        shouldCreateUser: false,
      );
    } catch (e) {
      rethrow;
    }
  }
}
