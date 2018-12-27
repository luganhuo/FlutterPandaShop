import 'package:flutter/material.dart';
import 'package:pandashop/mockup/constants/constant_border_radius.dart';
import 'package:pandashop/mockup/constants/constant_colors.dart';
import 'package:pandashop/mockup/constants/constant_fonts.dart';

class ButtonFactory {
  static FlatButton primaryButton(BuildContext context, String title, VoidCallback onPressed) => FlatButton(
        shape: BorderRadiusDef.cornerRadius4,
        child: Text(
          title,
          style: PandaTextStyle.sfui.copyWith(
            fontWeight: FontWeight.w500,
            color: Colours.white,
          ),
        ),
        onPressed: onPressed,
        color: Colours.white34,
        highlightColor: Colours.white136,
      );

  static FlatButton secondaryButton(BuildContext context, String title, VoidCallback onPressed) => FlatButton(
        shape: BorderRadiusDef.cornerRadius4,
        child: Text(
          title,
          style: PandaTextStyle.gotham.copyWith(color: Colours.white34),
        ),
        onPressed: onPressed,
        color: Colours.white216,
        highlightColor: Colours.white246,
      );
}
