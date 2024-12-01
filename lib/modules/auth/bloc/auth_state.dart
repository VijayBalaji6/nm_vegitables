part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class PhoneNumberPageState extends AuthState {
  final PhoneNumberState phoneNumberState;
  const PhoneNumberPageState(this.phoneNumberState);
  @override
  List<Object> get props => [phoneNumberState];
}

class OtpPageState extends AuthState {
  final OtpState otpState;
  const OtpPageState(this.otpState);
  @override
  List<Object> get props => [otpState];
}

final class UserDetailSubmissionState extends AuthState {}
