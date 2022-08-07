import 'package:authentication/core/extensions/string_ext.dart';
import 'package:authentication/locale_keys.g.dart';
import 'package:authentication/theme/ui_text_style.dart';
import 'package:flutter/material.dart';

class AlreadyAMember extends StatelessWidget {
  final Function() press;

  const AlreadyAMember({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.already_a_member.trans(),
          style: UITextStyle.blackWash_14w400,
        ),
        TextButton(
          onPressed: press,
          child: Text(
            LocaleKeys.login.trans(),
            style: UITextStyle.blackWash_14w600,
          ),
        ),
      ],
    );
  }
}
