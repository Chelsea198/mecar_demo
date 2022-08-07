import 'package:authentication/theme/ui_color.dart';
import 'package:authentication/theme/ui_text_style.dart';
import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {
  final String text;
  final bool isEnable;
  final Function()? press;

  const RoundedTextButton({Key? key, required this.isEnable, required this.press, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(isEnable ? UIColor.blackDark : UIColor.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: BorderSide(
              color: isEnable ? UIColor.blackWash : UIColor.grey,
            ),
          ),
        ),
      ),
      onPressed: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: isEnable ? UITextStyle.white_16w400 : UITextStyle.grey_16w400,
            ),
          ],
        ),
      ),
    );
  }
}
