import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';
import '../../../constants/constant_spacing.dart';
import '../../../modules/me/components/component_country_cell.dart';
import '../../../translations.dart';

class WidgetMeLocationCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.m, Spacing.m, Spacing.s),
      height: 183,
      width: MediaQuery.of(context).size.width,
      color: Colours.white,
      child: Material(
        color: Colours.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 28,
              child: Text(
                Translations.of(context).text("myLocation"),
                style: PandaTextStyle.polaris.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            SizedBox(
              height: Spacing.s,
            ),
            WidgetCountryLocation(),
            SizedBox(
              height: Spacing.s,
            ),
            Expanded(
              child: Container(
                child: Text(
                  Translations.of(context).text("myLocationFooter"),
                  style: PandaTextStyle.polaris.copyWith(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
