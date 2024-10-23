import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/network/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(PhoneNumberInitial()) {
    on<PhoneNumberSubmitted>(_onPhoneNumberSubmitted);
    on<OtpSubmitted>(_onOtpSubmitted);
    on<ResendOtpRequested>(_onResendOtpRequested);
  }

  _onPhoneNumberSubmitted(PhoneNumberSubmitted event, Emitter<AuthState> emit) {
    emit(PhoneNumberLoading());
    try {
      authRepository.createUserGetOtp(phoneNumber: event.phoneNumber);

      emit(PhoneNumberSuccess());
    } catch (e) {
      emit(PhoneNumberFailure(e.toString()));
    }
  }

  _onOtpSubmitted(OtpSubmitted event, Emitter<AuthState> emit) {
    emit(OtpLoading());
    try {
      authRepository.loginWithOtp(
          phoneNumber: event.phoneNumber, token: event.otp);
      emit(OtpSuccess());
    } catch (e) {
      emit(OtpFailure(e.toString()));
    }
  }

  _onResendOtpRequested(ResendOtpRequested event, Emitter<AuthState> emit) {
    try {
      emit(PhoneNumberLoading());
    } catch (e) {
      emit(PhoneNumberFailure(e.toString()));
    }
  }
}
