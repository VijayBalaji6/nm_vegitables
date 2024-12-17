import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/models/auth/auth_models.dart';
import 'package:shopping_app/network/repository/auth_repository.dart';
import 'package:shopping_app/service_locator.dart';
import 'package:shopping_app/utils/config/constants/app_enum.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = sl<AuthRepository>();

  AuthBloc()
      : super(PhoneNumberPageState(PhoneNumberState(
            phoneNumber: '', eventStatus: EventStatus.initial))) {
    on<PhoneNumberPageInitEvent>(_onPhoneNumberPageInitEvent);
    on<PhoneNumberSubmitted>(_onPhoneNumberSubmitted);
    on<OtpPageInitEvent>(_onOtpPageInitEvent);
    on<OtpSubmitted>(_onOtpSubmitted);
    on<ResendOtpRequested>(_onResendOtpRequested);
  }

  _onPhoneNumberPageInitEvent(
      PhoneNumberPageInitEvent event, Emitter<AuthState> emit) {
    if (state is PhoneNumberPageState) {
      final currentState = state as PhoneNumberPageState;
      // Emit a new state with the updated phone number
      emit(PhoneNumberPageState(
        currentState.phoneNumberState.copyWith(
          phoneNumber: event.phoneNumber,
        ),
      ));
    } else {
      emit(PhoneNumberPageState(PhoneNumberState(
          phoneNumber: event.phoneNumber, eventStatus: EventStatus.initial)));
    }
  }

  Future<void> _onPhoneNumberSubmitted(
      PhoneNumberSubmitted event, Emitter<AuthState> emit) async {
    final PhoneNumberPageState currentState = state as PhoneNumberPageState;
    emit(PhoneNumberPageState(currentState.phoneNumberState
        .copyWith(eventStatus: EventStatus.loading, message: "Loading")));
    try {
      await _authRepository.loginUserGetOtp(phoneNumber: event.phoneNumber);
      emit(PhoneNumberPageState(currentState.phoneNumberState
          .copyWith(eventStatus: EventStatus.success, message: "Success")));
    } catch (e) {
      emit(PhoneNumberPageState(currentState.phoneNumberState
          .copyWith(eventStatus: EventStatus.failed, message: e.toString())));
    }
  }

  _onOtpPageInitEvent(OtpPageInitEvent event, Emitter<AuthState> emit) {
    try {
      if (state is OtpPageState) {
        final currentState = state as OtpPageState;
        emit(OtpPageState(currentState.otpState.copyWith(otp: event.otp)));
      } else {
        emit(OtpPageState(OtpState(
            phoneNumber: event.phoneNumber,
            otp: '',
            eventStatus: EventStatus.initial)));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _onOtpSubmitted(
      OtpSubmitted event, Emitter<AuthState> emit) async {
    final OtpPageState currentState = state as OtpPageState;
    emit(OtpPageState(currentState.otpState
        .copyWith(eventStatus: EventStatus.loading, message: "Loading")));
    try {
      await _authRepository.loginWithOtp(
          phoneNumber: event.phoneNumber, token: event.otp);
      emit(OtpPageState(currentState.otpState
          .copyWith(eventStatus: EventStatus.success, message: "Success")));
    } catch (e) {
      emit(OtpPageState(currentState.otpState
          .copyWith(eventStatus: EventStatus.failed, message: e.toString())));
    }
  }

  _onResendOtpRequested(ResendOtpRequested event, Emitter<AuthState> emit) {
    final OtpPageState currentState = state as OtpPageState;
    emit(OtpPageState(currentState.otpState
        .copyWith(eventStatus: EventStatus.loading, message: "Loading")));
    try {
      _authRepository.createUserGetOtp(phoneNumber: event.phoneNumber);
      emit(OtpPageState(currentState.otpState
          .copyWith(eventStatus: EventStatus.success, message: "Loading")));
    } catch (e) {
      emit(OtpPageState(currentState.otpState
          .copyWith(eventStatus: EventStatus.failed, message: "Loading")));
    }
  }
}
