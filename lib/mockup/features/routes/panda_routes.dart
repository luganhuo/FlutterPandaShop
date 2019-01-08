import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../modules/webView/window_web_view.dart';

typedef VoidCallbackParam1 = void Function(dynamic result);

class FeatureModel {
  final String route;
  final Handler handler;
  final TransitionType transitionType;

  FeatureModel({@required this.route, @required this.handler, this.transitionType = TransitionType.native});
}

class PandaFeatures {
  static final Router _gRouter = Router();
  static final List<FeatureModel> _routeHandlers = [
    FeatureModel(
      route: "/webView",
      handler: Handler(
          handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
            var origin = parameters["uri"]?.first;
            Map<String, dynamic> jsonObj = _decodeAsMap(origin);

            var url = jsonObj["url"];
            var title = "";
            if (jsonObj.containsKey("title")) {
              title = jsonObj["title"];
            }

            return WindowWebView(title: title, url: url);
          },
          type: HandlerType.route),
    )
  ];

  static configureRouters() {
    for (var eachRouteHandler in _routeHandlers) {
      _gRouter.define(
        eachRouteHandler.route,
        handler: eachRouteHandler.handler,
        transitionType: eachRouteHandler.transitionType,
      );
    }
  }

  static webView(BuildContext context, String title, String url, Function callback) {
    Map<String, String> urlJson = {
      "url": title.length > 0 ? url : "",
      "title": title.length > 0 ? title : "",
    };
    String urlEncoded = _encodeAsQueryComponent(urlJson);
    _gRouter.navigateTo(context, "/webView?uri=$urlEncoded");
  }

  static Map<String, dynamic> _decodeAsMap(String origin) {
    var encodedBase64Str = Uri.decodeQueryComponent(origin);
    var encodedBase64Bytes = Base64Codec.urlSafe().decode(encodedBase64Str);
    var encodedJsonStr = utf8.decode(encodedBase64Bytes);
    Map<String, dynamic> jsonObj = JsonDecoder().convert(encodedJsonStr);
    return jsonObj;
  }

  static String _encodeAsQueryComponent(Map<String, String> urlJson) {
    String urlJsonStr = JsonEncoder().convert(urlJson);
    var urlUtf8Bytes = utf8.encode(urlJsonStr);
    var urlBase64 = Base64Codec.urlSafe().encode(urlUtf8Bytes);
    var urlEncoded = Uri.encodeQueryComponent(urlBase64);
    return urlEncoded;
  }
}
