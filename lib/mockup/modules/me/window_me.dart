import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../component/tab_bar_icon_item.dart';
import '../../constants/constant_images.dart';
import '../../modules/protocols/protocol_main_page.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';
import '../../translations.dart';
import '../../utils/image_in_assets.dart';

import 'widgets/widget_me_contract_cell.dart';
import 'widgets/widget_me_footer_cell.dart';
import 'widgets/widget_me_gender_choise_cell.dart';
import 'widgets/widget_me_location_cell.dart';
import 'widgets/widget_me_login_cell.dart';
import 'widgets/widget_me_settings_cell.dart';
import 'widgets/widget_me_support_cell.dart';

class MeWindow extends StatefulWidget implements MainPageProtocol {
  _MeWindowState createState() => _MeWindowState();

  @override
  Widget naviHeaderView(BuildContext context) {
    // TODO: implement naviHeaderView
    return Text(Translations.of(context).text("tabbarItemMeTitle"));
  }

  @override
  List<Widget> naviLeftButtons(BuildContext context) {
    // TODO: implement naviLeftButtons
    return null;
  }

  @override
  List<Widget> naviRightButtons(BuildContext context) {
    // TODO: implement naviRightButtons
    return null;
  }

  @override
  TabBarItemProtocol tabBarItem(BuildContext context) {
    // TODO: implement tabBarItem
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
              String url = "http://www.baidu.com";
              client.get(url)
                  .then((response) => print(response.body))
                  .whenComplete(client.close);
            },
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
