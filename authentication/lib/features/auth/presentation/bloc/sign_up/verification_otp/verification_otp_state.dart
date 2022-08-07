import 'package:authentication/core/constants/constants.dart';

class VerificationOTPState {
  final int countDownTime;
  final bool isEnableVerify;
  final bool isEnableResend;
  final String otp;

  const VerificationOTPState({
    this.countDownTime = Constants.durationResendOTP, // seconds
    this.isEnableResend = false,
    this.isEnableVerify = false,
    this.otp = '',
  });

  VerificationOTPState copyWith({
    int? countDownTime,
    bool? isEnableVerify,
    bool? isEnableResend,
    String? otp,
  }) =>
      VerificationOTPState(
        countDownTime: countDownTime ?? this.countDownTime,
        isEnableResend: isEnableResend ?? this.isEnableResend,
        isEnableVerify: isEnableVerify ?? this.isEnableVerify,
        otp: otp ?? this.otp,
      );
}
