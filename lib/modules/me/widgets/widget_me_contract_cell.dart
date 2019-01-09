import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';
import '../../../constants/constant_images.dart';
import '../../../constants/constant_spacing.dart';
import '../../../core/multi_lang/translations.dart';
import '../../../modules/me/components/component_section_header.dart';
import '../../../utils/image_in_assets.dart';

class WidgetMyContractUsCell extends StatelessWidget {
  static double kContainerHeight = 84.0;

  final VoidCallback onPressTelephone;
  final VoidCallback onPressEmail;

  const WidgetMyContractUsCell({Key key, this.onPressTelephone, this.onPressEmail}) : super(key: key);

  Container _verticalButton(BuildContext context, Image icon, String title, VoidCallback onPressed) {
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Container(
              margin: EdgeInsets.only(top: Spacing.xxxs),
              height: 22,
              child: Text(
                title,
                style: PandaTextStyle.polaris.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.s, Spacing.m, Spacing.s + Spacing.xs),
            child: SectionHeader(title: Translations.of(context).text("contactUs")),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colours.white216, width: 0.5),
                bottom: BorderSide(color: Colours.white216, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: kContainerHeight,
                    child: _verticalButton(
                      context,
                      ImageInAssets(name: Images.phone_icon).image(),
                      Translations.of(context).text("phone"),
                      this.onPressTelephone,
                    ),
                  ),
                ),
                Container(
                  color: Colours.white216,
                  width: 0.5,
                  height: kContainerHeight,
                ),
                Expanded(
                  child: Container(
                    height: kContainerHeight,
                    child: _verticalButton(
                      context,
                      ImageInAssets(name: Images.email_icon).image(),
                      Translations.of(context).text("byEmail"),
                      this.onPressEmail,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
