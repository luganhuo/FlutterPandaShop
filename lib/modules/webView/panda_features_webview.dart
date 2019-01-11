import 'package:flutter/widgets.dart';

import '../../core/route/panda_routable_model.dart';
import '../../core/route/panda_routes.dart';

void gotoWebView(BuildContext context, String url, Function callback, {String title}) {
  Map<String, String> urlJson = {
    "url": title.length > 0 ? url : "",
    "title": title.length > 0 ? title : "",
  };
  String urlEncoded = PandaRoutableModel.encodeAsQueryComponent(urlJson);
  PandaRoute.router().navigateTo(context, "/webView?uri=$urlEncoded");
}
