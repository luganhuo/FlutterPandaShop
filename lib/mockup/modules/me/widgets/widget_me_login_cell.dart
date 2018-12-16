import 'package:flutter/material.dart';

import '../../../constants/constant_border_radius.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_fonts.dart';
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
                  child: FlatButton(
                    shape: BorderRadiusDef.cornerRadius4,
                    child: Text(
                      Translations.of(context).text("registerViewRegisterButton"),
                      style: PandaTextStyle.gotham.copyWith(color: Colours.white34),
                    ),
                    onPressed: this.onRegister,
                    color: Colours.white216,
                  ),
                ),
                SizedBox(
                  width: Spacing.s,
                ),
                Expanded(
                  child: FlatButton(
                      shape: BorderRadiusDef.cornerRadius4,
                      child: Text(
                        Translations.of(context).text("loginViewSignInButton"),
                        // style: TextStyle(color: Colours.COLOR_WHITE),
                        style: PandaTextStyle.sfui.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colours.white,
                        ),
                      ),
                      onPressed: this.onSignIn,
                      color: Colours.white34),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
