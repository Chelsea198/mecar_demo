import 'package:equatable/equatable.dart';

abstract class VerificationOTPEvent extends Equatable {
  const VerificationOTPEvent();

  @override
  List<Object?> get props => [];
}

class CountDownTimeEvent extends VerificationOTPEvent {
  const CountDownTimeEvent({required this.time});

  final int time;

  @override
  List<Object?> get props => [time];
}

class OTPChangedEvent extends VerificationOTPEvent {
  const OTPChangedEvent({required this.otp});

  final String otp;

  @override
  List<Object?> get props => [otp];
}

class ResendEvent extends VerificationOTPEvent {
  const ResendEvent();
}
