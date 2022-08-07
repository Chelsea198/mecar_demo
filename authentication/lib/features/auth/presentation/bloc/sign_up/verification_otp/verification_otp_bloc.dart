import 'dart:async';

import 'package:authentication/core/constants/constants.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/verification_otp/verification_otp_event.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/verification_otp/verification_otp_state.dart';
import 'package:authentication/features/auth/presentation/helper/ticker.dart';
import 'package:bloc/bloc.dart';

class VerificationOTPBloc extends Bloc<VerificationOTPEvent, VerificationOTPState> {
  VerificationOTPBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const VerificationOTPState()) {
    on<CountDownTimeEvent>(_onCountDownTime);
    on<OTPChangedEvent>(_onOTPChanged);
    on<ResendEvent>(_onResend);
  }

  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onCountDownTime(CountDownTimeEvent event, Emitter<VerificationOTPState> emit) {
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: event.time).listen((duration) => add(CountDownTimeEvent(time: duration)));
    emit(
      state.copyWith(
        isEnableResend: event.time <= 0,
        countDownTime: event.time,
      ),
    );
  }

  void _onOTPChanged(OTPChangedEvent event, Emitter<VerificationOTPState> emit) {
    if (event.otp.length >= Constants.lengthOTP) {
      emit(
        state.copyWith(
          isEnableVerify: true,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        isEnableVerify: false,
        otp: event.otp,
      ),
    );
  }

  void _onResend(ResendEvent event, Emitter<VerificationOTPState> emit) {
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: Constants.durationResendOTP).listen((duration) => add(CountDownTimeEvent(time: duration)));
  }
}
