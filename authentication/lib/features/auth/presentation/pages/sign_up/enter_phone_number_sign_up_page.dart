import 'package:authentication/core/router/route_name.dart';
import 'package:authentication/core/ui/custom_app_bar.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/form_enter_phone_number/form_enter_phone_number_bloc.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/form_enter_phone_number/form_enter_phone_number_state.dart';
import 'package:authentication/features/auth/presentation/pages/sign_up/widgets/already_a_member.dart';
import 'package:authentication/features/auth/presentation/pages/sign_up/widgets/form_enter_phone_number.dart';
import 'package:authentication/theme/ui_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPhoneNumberSignUpPage extends StatelessWidget {
  const EnterPhoneNumberSignUpPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const EnterPhoneNumberSignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormEnterPhoneNumberBloc(),
      child: Scaffold(
        backgroundColor: UIColor.white,
        appBar: CustomAppBar(
          height: 80,
          action: () => Navigator.pop(context),
        ),
        body: BlocListener<FormEnterPhoneNumberBloc, FormEnterPhoneNumberState>(
          listener: (context, state) {
            if (state.formSubmittedSuccessfully) {
              Navigator.pushNamed(context, RouteName.verificationOTPRoute, arguments: state.phoneNumber);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: FormEnterPhoneNumber(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AlreadyAMember(
                  press: () => {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
