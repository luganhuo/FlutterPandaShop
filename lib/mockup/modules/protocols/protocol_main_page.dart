import 'package:flutter/widgets.dart';
import '../../modules/protocols/protocol_tab_bar_item.dart';

abstract class MainPageProtocol {
  Widget naviHeaderView(BuildContext context);
  List<Widget> naviLeftButtons(BuildContext context);
  List<Widget> naviRightButtons(BuildContext context);
  TabBarItemProtocol tabBarItem(BuildContext context);
}