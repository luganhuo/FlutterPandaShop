import 'package:flutter/widgets.dart';

void dismissKeyboard(BuildContext context) {
  debugPrint("** dismissKeyboard called.");
  FocusScope.of(context).requestFocus(new FocusNode());
}
