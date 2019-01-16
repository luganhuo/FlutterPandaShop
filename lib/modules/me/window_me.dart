import 'package:flutter/material.dart';
import 'package:flutter_panda_appkit/flutter_panda_appkit.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/external_launch/urlLauncher.dart';
import '../../core/multi_lang/translations.dart';
import '../../modules/signUpAndSignIn/panda_features_login.dart';
import 'widgets/widget_me_contract_cell.dart';
import 'widgets/widget_me_footer_cell.dart';
import 'widgets/widget_me_gender_choise_cell.dart';
import 'widgets/widget_me_location_cell.dart';
import 'widgets/widget_me_login_cell.dart';
import 'widgets/widget_me_settings_cell.dart';
import 'widgets/widget_me_support_cell.dart';
//import '../../component/tab_bar_icon_item.dart';
//import '../../constants/constant_images.dart';
//import '../../modules/protocols/protocol_main_page.dart';
//import '../../modules/protocols/protocol_tab_bar_item.dart';

class MeWindow extends StatefulWidget implements MainPageProtocol {
  _MeWindowState createState() => _MeWindowState();

  @override
  Widget navigatorHeaderView(BuildContext context) {
    return Text(Translations.of(context).text("tabbarItemMeTitle"));
  }

  @override
  List<Widget> navigatorLeftButtons(BuildContext context) {
    return null;
  }

  @override
  List<Widget> navigatorRightButtons(BuildContext context) {
    return null;
  }

  @override
  TabBarItemProtocol tabBarItem(BuildContext context) {
    return TabBarIconItem(
        title: Translations.of(context).text("tabbarItemMeTitle"),
        icon: ImageIcon(ImageInAssets(name: Images.me_offstate_icon).assetImage()),
        activeIcon: ImageIcon(ImageInAssets(name: Images.me_onstate_icon).assetImage()));
  }
}

class _MeWindowState extends State<MeWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: ListView(
        children: <Widget>[
          WidgetMeLoginCell(
            onRegister: () {
              print('register pressed');

              http.Client client = http.Client();
              String url = "http://www.farfetch.com";
              client.get(url).then((response) => print(response.body)).whenComplete(client.close);
            },
            onSignIn: () {
              print('signin pressed');
              gotoLogin(context);
            },
          ),
          WidgetMeLocationCell(),
          WidgetMeGenderChoice(),
          WidgetMySettingsCell(enableAppId: true),
          WidgetMySupportCell(),
          WidgetMyContractUsCell(
            onPressTelephone: () => ExternalLauncher.launchUrl("tel:+8613818871821"),
            onPressEmail: () => ExternalLauncher.launchUrl("mailto:derrick.zhu@farfetch.com"),
          ),
          WidgetMyPageFooter(),
        ],
      )),
    );
  }
}
