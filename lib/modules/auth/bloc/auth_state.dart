part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class PhoneNumberInitial extends AuthState {}

class PhoneNumberLoading extends AuthState {}

class PhoneNumberSuccess extends AuthState {}

class PhoneNumberFailure extends AuthState {
  final String error;

  const PhoneNumberFailure(this.error);

  @override
  List<Object> get props => [error];
}

class OtpInitial extends AuthState {}

class OtpLoading extends AuthState {}

class OtpSuccess extends AuthState {}

class OtpFailure extends AuthState {
  final String error;

  const OtpFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class UserDetailSubmissionState extends AuthState {}
