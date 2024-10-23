part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberSubmitted extends AuthEvent {
  final String phoneNumber;

  const PhoneNumberSubmitted(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class OtpSubmitted extends AuthEvent {
  final String phoneNumber;
  final String otp;

  const OtpSubmitted(this.otp, this.phoneNumber);

  @override
  List<Object> get props => [otp, phoneNumber];
}

class ResendOtpRequested extends AuthEvent {
  final String phoneNumber;
  const ResendOtpRequested(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
