import 'package:authentication/core/router/route_name.dart';
import 'package:authentication/features/auth/presentation/pages/sign_up/enter_phone_number_sign_up_page.dart';
import 'package:authentication/features/auth/presentation/pages/sign_up/verification_otp_sign_up_page.dart';
import 'package:authentication/features/auth/presentation/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class MyRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case RouteName.enterPhoneSignUpRoute:
        return MaterialPageRoute(builder: (_) => const EnterPhoneNumberSignUpPage());
      case RouteName.verificationOTPRoute:
        final String? phoneNumber = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => VerificationOTPSignUpPage(phoneNumber: phoneNumber ?? ""));
      default:
        return null;
    }
  }
}
