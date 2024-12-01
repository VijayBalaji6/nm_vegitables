// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopping_app/utils/config/constants/app_enum.dart';

class PhoneNumberState {
  String phoneNumber = "";
  EventStatus eventStatus = EventStatus.initial;
  String? message;

  PhoneNumberState({
    required this.phoneNumber,
    required this.eventStatus,
    this.message,
  });

  PhoneNumberState copyWith(
      {String? phoneNumber, EventStatus? eventStatus, String? message}) {
    return PhoneNumberState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        eventStatus: eventStatus ?? this.eventStatus,
        message: message ?? this.message);
  }
}

class OtpState {
  String phoneNumber;
  String otp = "";
  EventStatus eventStatus = EventStatus.initial;
  String? message;

  OtpState({
    required this.phoneNumber,
    required this.otp,
    required this.eventStatus,
    this.message,
  });

  OtpState copyWith({String? otp, EventStatus? eventStatus, String? message}) {
    return OtpState(
      phoneNumber: phoneNumber,
      otp: otp ?? this.otp,
      eventStatus: eventStatus ?? this.eventStatus,
      message: message ?? this.message,
    );
  }
}
