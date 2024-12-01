import 'package:shopping_app/service_locator.dart';
import 'package:shopping_app/utils/config/api_base/supabase_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthServiceRepository {
  User? checkAuth();
  Future<bool> loginWithOtp({required String token, required String phone});
  Future<void> getOtpForSignIn(String phone);
  Future<void> getOtpForLogin(String phone);
}

class AuthServiceImp extends AuthServiceRepository {
  final SupabaseClient supabaseClient = sl<SupabaseManager>().supabaseClient;
  @override
  User? checkAuth() {
    final Session? session = supabaseClient.auth.currentSession;

    if (session != null) {
      return supabaseClient.auth.currentUser;
    } else {
      return null;
    }
  }

  @override
  Future<bool> loginWithOtp(
      {required String token, required String phone}) async {
    try {
      await supabaseClient.auth.verifyOTP(
        type: OtpType.sms,
        token: token,
        phone: phone,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> getOtpForSignIn(String phone) async {
    try {
      await supabaseClient.auth.signInWithOtp(
        phone: "+91 $phone",
        shouldCreateUser: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> getOtpForLogin(String phone) async {
    try {
      await supabaseClient.auth.signInWithOtp(
        phone: "+91 $phone",
        shouldCreateUser: false,
      );
    } catch (e) {
      rethrow;
    }
  }
}
