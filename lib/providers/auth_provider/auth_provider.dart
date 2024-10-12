import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/providers/auth_provider/auth_data_source.dart';
import 'package:shopping_app/providers/auth_provider/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  AuthNotifier(this.dataSource) : super(AuthenticationState.initial());

  final AuthDataSource dataSource;

  Future<void> signup(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber}) async {
    state = AuthenticationState.loading();
    final response = await dataSource.userSignUp(
        name: name, email: email, password: password, phoneNumber: phoneNumber);
    response == true
        ? state = AuthenticationState.authenticated(
            user: dataSource.auth.currentUser!)
        : state = AuthenticationState.unauthenticated();
  }

  Future<void> login({required String email, required String password}) async {
    state = AuthenticationState.loading();
    final response = await dataSource.signInUsingEmail(email, password);
    response == true
        ? state = AuthenticationState.authenticated(
            user: dataSource.auth.currentUser!)
        : state = AuthenticationState.unauthenticated();
  }
}
