import 'package:flutter/material.dart';

import 'widgets/widget_me_contract_cell.dart';
import 'widgets/widget_me_footer_cell.dart';
import 'widgets/widget_me_gender_choise_cell.dart';
import 'widgets/widget_me_location_cell.dart';
import 'widgets/widget_me_login_cell.dart';
import 'widgets/widget_me_settings_cell.dart';
import 'widgets/widget_me_support_cell.dart';

class MeWindow extends StatefulWidget {
  _MeWindowState createState() => _MeWindowState();
}

class _MeWindowState extends State<MeWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: ListView(
        children: <Widget>[
          WidgetMeLoginCell(
            onRegister: () => print('register pressed'),
            onSignIn: () => print('signin pressed'),
          ),
          WidgetMeLocationCell(),
          WidgetMeGenderChoice(),
          WidgetMySettingsCell(enableAppId: true),
          WidgetMySupportCell(),
          WidgetMyContractUsCell(
            onPressTelephone: () => print("Telephone pressed."),
            onPressEmail: () => print("Email pressed."),
          ),
          WidgetMyPageFooter(),
        ],
      )),
    );
  }
}
