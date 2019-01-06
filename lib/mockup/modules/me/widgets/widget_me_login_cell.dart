import 'package:flutter/material.dart';

import '../../../component/button/button_factory.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_define.dart';
import '../../../constants/constant_spacing.dart';
import '../../../translations.dart';

class WidgetMeLoginCell extends StatelessWidget {
  final VoidCallback onRegister;
  final VoidCallback onSignIn;

  const WidgetMeLoginCell({Key key, this.onRegister, this.onSignIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spacing.m),
      height: 160.0,
      color: Colours.white246,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                Translations.of(context).text('loginTableViewCellDescription'),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(left: Spacing.m, right: Spacing.m),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: Spacing.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ButtonFactory.secondaryButton(
                        context, Translations.of(context).text("registerViewRegisterButton"), this.onRegister),
                    height: Defines.ButtonHeightNormal,
                  ),
                ),
                SizedBox(width: Spacing.s),
                Expanded(
                  child: Container(
                    child: ButtonFactory.primaryButton(
                        context, Translations.of(context).text("loginViewSignInButton"), this.onSignIn),
                    height: Defines.ButtonHeightNormal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
