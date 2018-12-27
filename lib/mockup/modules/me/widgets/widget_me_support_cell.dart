import 'package:flutter/material.dart';

import '../../../translations.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_spacing.dart';
import '../../../modules/me/components/component_data_selector.dart';
import '../../../modules/me/components/component_section_header.dart';

class WidgetMySupportCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.s, Spacing.m, Spacing.m),
      color: Colours.white,
      child: Column(
        children: <Widget>[
          SectionHeader(
            title: Translations.of(context).text("support"),
          ),
          DataSelector(title: Translations.of(context).text("secondaryNavigationAbout"), onPressed: () => print('secondaryNavigationAbout pressed')),
          DataSelector(title: Translations.of(context).text("secondaryNavigationTermsConditions"), onPressed: () => print('secondaryNavigationTermsConditions pressed')),
          DataSelector(title: Translations.of(context).text("secondaryNavigationPrivacyPolicy"), onPressed: () => print('secondaryNavigationPrivacyPolicy pressed')),
          DataSelector(title: Translations.of(context).text("secondaryNavigationFaqsGuides"), onPressed: () => print('secondaryNavigationFaqsGuides pressed')),
          DataSelector(title: Translations.of(context).text("farfetchPartners"), onPressed: () => print('farfetchPartners pressed')),
        ],
      ),
    );
  }
}
