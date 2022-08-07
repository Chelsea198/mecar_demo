import 'package:authentication/theme/ui_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Function()? action;

  const CustomAppBar({Key? key, required this.height, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: UIColor.white,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 24, top: 10),
      child: InkWell(
        onTap: () => action?.call(),
        child: SizedBox(
          width: 18,
          height: 18,
          child: Image.asset(
            "assets/icons/ic_back.png",
            width: 18,
            height: 14,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
