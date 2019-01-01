import 'package:flutter/widgets.dart';

abstract class MainPageProtocol {
  Widget naviHeaderView(BuildContext context);
  List<Widget> naviLeftButtons(BuildContext context);
  List<Widget> naviRightButtons(BuildContext context);
}