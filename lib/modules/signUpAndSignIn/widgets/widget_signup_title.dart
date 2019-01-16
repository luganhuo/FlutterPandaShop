import 'package:flutter/widgets.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';

import '../../../core/multi_lang/translations.dart';
//import '../../../constants/constant_fonts.dart';
//import '../../../constants/constant_spacing.dart';

class WidgetSignupTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spacing.m),
      child: Row(
        children: <Widget>[
          Text(
            Translations.of(context).text("registerTitle"),
            style: PandaTextStyle.polaris.copyWith(fontSize: 26, fontWeight: FontWeight.w700),
          ),
          Spacer()
        ],
      ),
    );
  }
}
