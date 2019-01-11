import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant_colors.dart';
import '../../../constants/constant_spacing.dart';
import '../../../core/multi_lang/translations.dart';
import '../../../modules/me/components/component_data_selector.dart';
import '../../../modules/me/components/component_section_header.dart';
import '../../webView/panda_features_webview.dart';

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
                gotoWebView(
                  context,
                  "$_farfetchEndpoints/pag1988.aspx?ffref=ftr",
                  (_) {},
                  title: Translations.of(context).text("secondaryNavigationAbout"),
                );
              }),
          DataSelector(
              title: Translations.of(context).text("secondaryNavigationTermsConditions"),
              onPressed: () {
                debugPrint('secondaryNavigationTermsConditions pressed');
                gotoWebView(
                  context,
                  "$_farfetchEndpoints/terms-and-conditions",
                  (_) {},
                  title: Translations.of(context).text("secondaryNavigationTermsConditions"),
                );
              }),
          DataSelector(
              title: Translations.of(context).text("secondaryNavigationPrivacyPolicy"),
              onPressed: () {
                debugPrint('secondaryNavigationPrivacyPolicy pressed');
                gotoWebView(
                  context,
                  "$_farfetchEndpoints/privacy-policy",
                  (_) {},
                  title: Translations.of(context).text("secondaryNavigationPrivacyPolicy"),
                );
              }),
          DataSelector(
              title: Translations.of(context).text("secondaryNavigationFaqsGuides"),
              onPressed: () {
                debugPrint('secondaryNavigationFaqsGuides pressed');
                gotoWebView(
                  context,
                  "$_farfetchEndpoints/faqs",
                  (_) {},
                  title: Translations.of(context).text("secondaryNavigationFaqsGuides"),
                );
              }),
          DataSelector(
              title: Translations.of(context).text("farfetchPartners"),
              onPressed: () => print('farfetchPartners pressed')),
        ],
      ),
    );
  }
}
