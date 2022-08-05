import 'dart:ui';

import 'package:authentication/core/extensions/string_ext.dart';
import 'package:authentication/locale_keys.g.dart';
import 'package:authentication/theme/ui_color.dart';
import 'package:authentication/theme/ui_text_style.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SlideWelcomeWidget extends StatelessWidget {
  final List<String> slideImages;
  const SlideWelcomeWidget({Key? key, required this.slideImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return slideImages.isNotEmpty
        ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.48,
                child: Swiper(
                  itemCount: slideImages.length,
                  itemBuilder: (context, index) => SlideItem(
                    size: size,
                    imagePath: slideImages[index],
                  ),
                  autoplay: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: slideImages.asMap().entries.map((e) {
                  return Container(
                    width: 19,
                    height: 1,
                    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    color: UIColor.paginationColor,
                  );
                }).toList(),
              )
            ],
          )
        : const SizedBox();
  }
}

class SlideItem extends StatelessWidget {
  final Size size;
  final String imagePath;
  const SlideItem({Key? key, required this.size, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imagePath,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            padding: const EdgeInsets.only(left: 44, right: 66),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.32,
                ),
                Text(
                  LocaleKeys.welcome.trans(),
                  style: UITextStyle.white_28w600,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  LocaleKeys.introduce.trans(),
                  style: UITextStyle.errigalWhite_16w400,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
