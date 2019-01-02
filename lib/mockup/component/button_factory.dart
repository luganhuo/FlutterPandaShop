import 'package:flutter/material.dart';

import '../constants/constant_border_radius.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_fonts.dart';

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
        color: Colours.dark,
        highlightColor: Colours.white136,
      );

  static FlatButton secondaryButton(BuildContext context, String title, VoidCallback onPressed) => FlatButton(
        shape: BorderRadiusDef.cornerRadius4,
        child: Text(
          title,
          style: PandaTextStyle.gotham.copyWith(color: Colours.dark),
        ),
        onPressed: onPressed,
        color: Colours.grey,
        highlightColor: Colours.white246,
      );
}
