import 'package:authentication/core/extensions/string_ext.dart';
import 'package:authentication/features/auth/presentation/pages/welcome/widgets/slide_welcome_widget.dart';
import 'package:authentication/locale_keys.g.dart';
import 'package:authentication/theme/ui_color.dart';
import 'package:authentication/theme/ui_text_style.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final slideImages = <String>["assets/images/img_welcome.png", "assets/images/img_welcome.png"];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SlideWelcomeWidget(slideImages: slideImages),
                SizedBox(
                  height: size.height * 0.17,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: const BorderSide(
                            color: UIColor.blackWash,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () => {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: size.width,
                          ),
                          Image.asset(
                            "assets/icons/ic_email.png",
                            width: 22,
                            height: 17,
                          ),
                          Align(
                            child: Text(
                              LocaleKeys.login_with.trans(),
                              style: UITextStyle.blackWash_16w400.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: UIColor.blackWash,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.do_not_have_account.trans(),
                  style: UITextStyle.blackWash_14w400,
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    LocaleKeys.sign_up.trans(),
                    style: UITextStyle.blackWash_14w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
