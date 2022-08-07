import 'package:authentication/core/constants/constants.dart';
import 'package:authentication/core/extensions/string_ext.dart';
import 'package:authentication/core/ui/custom_app_bar.dart';
import 'package:authentication/core/ui/rounded_text_button.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/verification_otp/verification_otp_bloc.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/verification_otp/verification_otp_event.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/verification_otp/verification_otp_state.dart';
import 'package:authentication/features/auth/presentation/helper/ticker.dart';
import 'package:authentication/locale_keys.g.dart';
import 'package:authentication/theme/ui_color.dart';
import 'package:authentication/theme/ui_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationOTPSignUpPage extends StatelessWidget {
  final String phoneNumber;

  const VerificationOTPSignUpPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerificationOTPBloc>(
      create: (_) => VerificationOTPBloc(ticker: const Ticker())..add(const CountDownTimeEvent(time: Constants.durationResendOTP)),
      child: Scaffold(
        backgroundColor: UIColor.white,
        appBar: CustomAppBar(
          height: 80,
          action: () => Navigator.pop(context),
        ),
        body: BlocListener<VerificationOTPBloc, VerificationOTPState>(
          listener: (context, state) {
            /// do something
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  LocaleKeys.verification.trans(),
                  style: UITextStyle.blackDark_28w600,
                ),
                const SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    LocaleKeys.verification_description.trans(
                      namedArgs: {
                        "phoneNumber": phoneNumber,
                      },
                    ),
                    style: UITextStyle.blackWash_14w400,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 41,
                ),
                const _OTPInput(),
                const SizedBox(
                  height: 50,
                ),
                const _VerifyButton(),
                const SizedBox(
                  height: 20,
                ),
                const _ResendOTP()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OTPInput extends StatelessWidget {
  const _OTPInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 116),
      child: PinCodeTextField(
        appContext: context,
        length: Constants.lengthOTP,
        autoFocus: true,
        onChanged: (otp) {
          context.read<VerificationOTPBloc>().add(OTPChangedEvent(otp: otp));
        },
        keyboardType: TextInputType.number,
        textStyle: UITextStyle.blackWash_20w400,
        showCursor: false,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          activeColor: UIColor.grey,
          activeFillColor: UIColor.grey,
          selectedColor: UIColor.grey,
          inactiveColor: UIColor.grey,
          fieldWidth: 22,
        ),
      ),
    );
  }
}

class _VerifyButton extends StatelessWidget {
  const _VerifyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationOTPBloc, VerificationOTPState>(
      buildWhen: (previous, current) => previous.isEnableVerify != current.isEnableVerify,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RoundedTextButton(
          isEnable: state.isEnableVerify,
          press: () => {},
          text: LocaleKeys.verify.trans(),
        ),
      ),
    );
  }
}

class _ResendOTP extends StatelessWidget {
  const _ResendOTP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationOTPBloc, VerificationOTPState>(
      builder: (context, state) => TextButton(
        onPressed: state.isEnableResend ? () => context.read<VerificationOTPBloc>().add(const ResendEvent()) : null,
        child: Text(
          LocaleKeys.resend_code.trans(namedArgs: {"time": state.isEnableResend ? "" : "${state.countDownTime}s"}),
          style: state.isEnableResend ? UITextStyle.blueSparkle_14w400 : UITextStyle.grey_14w400,
        ),
      ),
    );
  }
}
