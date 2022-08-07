import 'package:authentication/core/extensions/string_ext.dart';
import 'package:authentication/core/ui/rounded_text_button.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/form_enter_phone_number/form_enter_phone_number_bloc.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/form_enter_phone_number/form_enter_phone_number_event.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/form_enter_phone_number/form_enter_phone_number_state.dart';
import 'package:authentication/locale_keys.g.dart';
import 'package:authentication/theme/ui_color.dart';
import 'package:authentication/theme/ui_text_style.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEnterPhoneNumber extends StatefulWidget {
  const FormEnterPhoneNumber({Key? key}) : super(key: key);

  @override
  _FormEnterPhoneNumberState createState() => _FormEnterPhoneNumberState();
}

class _FormEnterPhoneNumberState extends State<FormEnterPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 15,
      ),
      child: Column(
        children: [
          Text(
            LocaleKeys.sign_up.trans(),
            style: UITextStyle.blackDark_28w600,
          ),
          const SizedBox(
            height: 19,
          ),
          EasyRichText(
            LocaleKeys.sign_up_description.trans(),
            defaultStyle: UITextStyle.blackWash_14w400,
            textAlign: TextAlign.center,
            patternList: [
              EasyRichTextPattern(
                targetString: LocaleKeys.terms_of_use.trans(),
                style: UITextStyle.blueSparkle_14w400,
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              EasyRichTextPattern(
                targetString: LocaleKeys.privacy_policy.trans(),
                style: UITextStyle.blueSparkle_14w400,
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
          const SizedBox(
            height: 55,
          ),
          const _PhoneNumberInput(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<FormEnterPhoneNumberBloc, FormEnterPhoneNumberState>(
            builder: (context, state) => RoundedTextButton(
              isEnable: true,
              press: state.isPhoneNumberValid == true ? () => context.read<FormEnterPhoneNumberBloc>().add(const FormEnterPhoneSubmitted()) : null,
              text: LocaleKeys.next.trans(),
            ),
          )
        ],
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormEnterPhoneNumberBloc, FormEnterPhoneNumberState>(
      builder: (context, state) => TextField(
        autofocus: true,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              2,
            ),
            borderSide: const BorderSide(
              color: UIColor.grey,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              2,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              2,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              2,
            ),
            borderSide: const BorderSide(
              color: UIColor.grey,
            ),
          ),
          hintText: LocaleKeys.phone_number.trans(),
          hintStyle: UITextStyle.hintTextStyle,
          errorText: state.isPhoneNumberValid == false ? state.phoneNumber.phoneNumberError() : null,
        ),
        onChanged: (phone) {
          context.read<FormEnterPhoneNumberBloc>().add(PhoneNumberChanged(phone));
        },
      ),
    );
  }
}
