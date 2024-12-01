// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberPageInitEvent extends AuthEvent {
  final String phoneNumber;
  const PhoneNumberPageInitEvent({
    required this.phoneNumber,
  });
  @override
  List<Object> get props => [phoneNumber];
}

class PhoneNumberSubmitted extends AuthEvent {
  final String phoneNumber;

  const PhoneNumberSubmitted(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class OtpPageInitEvent extends AuthEvent {
  final String phoneNumber;
  const OtpPageInitEvent({
    required this.phoneNumber,
  });
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
