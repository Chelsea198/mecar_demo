import 'package:easy_localization/easy_localization.dart';

extension StringExt on String {
  String trans({List<String>? args, Map<String, String>? namedArgs, String? gender}) {
    return this.tr(args: args, namedArgs: namedArgs, gender: gender);
  }

  String? phoneNumberError() {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    final RegExp regExp = RegExp(pattern);
    if (length == 0) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(this)) {
      return 'Please enter valid phone number';
    }
    return null;
  }
}
