import 'package:flutter/material.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';

import '../../../core/multi_lang/translations.dart';
import '../../../modules/me/components/component_data_selector.dart';
import '../../../modules/me/components/component_section_header.dart';
//import '../../../constants/constant_colors.dart';
//import '../../../constants/constant_fonts.dart';
//import '../../../constants/constant_images.dart';
//import '../../../constants/constant_spacing.dart';

//import '../../../utils/image_in_assets.dart';

class WidgetMeLocationCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.m, Spacing.m, Spacing.m),
      width: MediaQuery.of(context).size.width,
      color: Colours.white,
      child: Material(
        color: Colours.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionHeader(
              title: Translations.of(context).text("myLocation"),
              height: 28,
            ),
            SizedBox(height: Spacing.s),
            DataSelector(
              icon: ImageInAssets(name: Images.flag_china).image(),
              title: "hello world",
              onPressed: () => print("WidgetCountryLocation pressed"),
            ),
            SizedBox(height: Spacing.s),
            Text(
              Translations.of(context).text("myLocationFooter"),
              style: PandaTextStyle.polaris.copyWith(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
