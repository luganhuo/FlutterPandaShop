import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_spacing.dart';
import '../../../features/routes/panda_routes.dart';
import '../../../modules/me/components/component_data_selector.dart';
import '../../../modules/me/components/component_section_header.dart';
import '../../../translations.dart';

class WidgetMySupportCell extends StatelessWidget {
  static String get _farfetchEndpoints => "https://www.farfetch.cn";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Spacing.m, Spacing.s, Spacing.m, Spacing.m),
      color: Colours.white,
      child: Column(
        children: <Widget>[
          SectionHeader(title: Translations.of(context).text("support")),
          DataSelector(
              title: Translations.of(context).text("secondaryNavigationAbout"),
              onPressed: () {
                debugPrint('secondaryNavigationAbout pressed');
                PandaFeatures.webView(
                  context,
                  Translations.of(context).text("secondaryNavigationAbout"),
                  "$_farfetchEndpoints/pag1988.aspx?ffref=ftr",
                  (_) {},
                );
              }),
          DataSelector(
              title: Translations.of(context).text("secondaryNavigationTermsConditions"),
              onPressed: () {
                debugPrint('secondaryNavigationTermsConditions pressed');
                PandaFeatures.webView(
                  context,
                  Translations.of(context).text("secondaryNavigationTermsConditions"),
                  "$_farfetchEndpoints/terms-and-conditions",
                  (_) {},
                );
              }),
          DataSelector(
              title: Translations.of(context).text("secondaryNavigationPrivacyPolicy"),
              onPressed: () {
                debugPrint('secondaryNavigationPrivacyPolicy pressed');
                PandaFeatures.webView(
                  context,
                  Translations.of(context).text("secondaryNavigationPrivacyPolicy"),
                  "$_farfetchEndpoints/privacy-policy",
                  (_) {},
                );
              }),
          DataSelector(
              title: Translations.of(context).text("secondaryNavigationFaqsGuides"),
              onPressed: () {
                debugPrint('secondaryNavigationFaqsGuides pressed');
                PandaFeatures.webView(
                  context,
                  Translations.of(context).text("secondaryNavigationFaqsGuides"),
                  "$_farfetchEndpoints/faqs",
                  (_) {},
                );
              }),
          DataSelector(title: Translations.of(context).text("farfetchPartners"), onPressed: () => print('farfetchPartners pressed')),
        ],
      ),
    );
  }
}
