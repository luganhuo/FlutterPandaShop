import 'package:flutter/material.dart';
import 'package:pandashop/mockup/constants/constant_fonts.dart';
import 'package:pandashop/mockup/constants/constant_spacing.dart';
import 'package:pandashop/mockup/translations.dart';

class WidgetMyPageFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.s, Spacing.m, Spacing.m),
      alignment: Alignment.center,
      child: Text(
        Translations.of(context).text("contactUsFooterChina"),
        textAlign: TextAlign.center,
        style: PandaTextStyle.polaris.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
