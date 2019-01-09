import 'package:flutter/widgets.dart';

import '../../modules/protocols/protocol_tab_bar_item.dart';

abstract class MainPageProtocol {
  Widget navigatorHeaderView(BuildContext context);
  List<Widget> navigatorLeftButtons(BuildContext context);
  List<Widget> navigatorRightButtons(BuildContext context);
  TabBarItemProtocol tabBarItem(BuildContext context);
}
