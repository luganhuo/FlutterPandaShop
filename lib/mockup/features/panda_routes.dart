import 'package:flutter/material.dart';

import '../modules/webView/window_web_view.dart';

typedef VoidCallbackParam1 = void Function(dynamic result);

class PandaFeatures {
  static webView(BuildContext context, String title, String url, Function callback) {
//    PandaRouter.navigateTo(context: context, url: "/webView?url=$url");
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return WindowWebView(
        url: url,
        title: title,
      );
    })).then((value) {
      callback(value);
    });
  }
}
