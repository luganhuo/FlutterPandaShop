import 'package:flutter/widgets.dart';

import '../../core/route/panda_routable_model.dart';
import '../../core/route/panda_routes.dart';
import '../../modules/webView/window_web_view.dart';

class PandaFeatureHelper {
  static List<PandaRoutableModel> _routeHandlers = [
    PandaRoutableModel(
      route: "/webView",
      handler: RouteHandler(
          handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
            var origin = parameters["uri"]?.first;
            Map<String, dynamic> jsonObj = PandaRoutableModel.decodeAsMap(origin);

            var url = jsonObj["url"];
            var title = "";
            if (jsonObj.containsKey("title")) {
              title = jsonObj["title"];
            }

            return WindowWebView(title: title, url: url);
          },
          type: RouteHandleType.route),
    ),
  ];

  static void registerAllRoutes() {
    for (var eachFeature in _routeHandlers) {
      PandaRoute.registerRoute(eachFeature);
    }
  }

  static webView(BuildContext context, String title, String url, Function callback) {
    Map<String, String> urlJson = {
      "url": title.length > 0 ? url : "",
      "title": title.length > 0 ? title : "",
    };
    String urlEncoded = PandaRoutableModel.encodeAsQueryComponent(urlJson);
    PandaRoute.router().navigateTo(context, "/webView?uri=$urlEncoded");
  }
}
