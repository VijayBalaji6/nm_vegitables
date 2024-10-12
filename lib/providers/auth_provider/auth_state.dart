import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationState {
  AuthenticationState.initial();

  AuthenticationState.loading();

  AuthenticationState.unauthenticated({String? message});

  AuthenticationState.authenticated({required User user});
}
