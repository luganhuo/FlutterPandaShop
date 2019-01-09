import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum RouteHandleType {
  route,
  function,
}

enum RouteTransitionType {
  native,
  nativeModal,
  inFromLeft,
  inFromRight,
  inFromBottom,
  fadeIn,
  custom,
}

typedef Widget RouteHandlerFunc(BuildContext context, Map<String, List<String>> params);

class RouteHandler {
  RouteHandler({this.type = RouteHandleType.route, this.handlerFunc});
  final RouteHandleType type;
  final RouteHandlerFunc handlerFunc;
}

class PandaRoutableModel {
  String _route;
  RouteHandler _handler;
  RouteTransitionType _transitionType;

  PandaRoutableModel({
    @required String route,
    @required RouteHandler handler,
    RouteTransitionType transitionType = RouteTransitionType.native,
  }) {
    this._route = route;
    this._handler = handler;
    this._transitionType = transitionType;
  }

  // public helpers

  String route() => this._route;
  Handler routeHandler() => Handler(
        type: PandaRoutableModel._fluroRouteType(this._handler),
        handlerFunc: PandaRoutableModel._fluroRouteFunc(this._handler),
      );
  TransitionType routeTransitionType() => PandaRoutableModel._fluroTransitionType(this._transitionType);

  static Map<String, dynamic> decodeAsMap(String origin) {
    var encodedBase64Str = Uri.decodeQueryComponent(origin);
    var encodedBase64Bytes = Base64Codec.urlSafe().decode(encodedBase64Str);
    var encodedJsonStr = utf8.decode(encodedBase64Bytes);
    Map<String, dynamic> jsonObj = JsonDecoder().convert(encodedJsonStr);
    return jsonObj;
  }

  static String encodeAsQueryComponent(Map<String, String> urlJson) {
    String urlJsonStr = JsonEncoder().convert(urlJson);
    var urlUtf8Bytes = utf8.encode(urlJsonStr);
    var urlBase64 = Base64Codec.urlSafe().encode(urlUtf8Bytes);
    var urlEncoded = Uri.encodeQueryComponent(urlBase64);
    return urlEncoded;
  }

  // private helpers

  static HandlerType _fluroRouteType(RouteHandler pandaRoute) {
    return HandlerType.values[pandaRoute.type.index];
  }

  static HandlerFunc _fluroRouteFunc(RouteHandler pandaRoute) {
    return pandaRoute.handlerFunc;
  }

  static TransitionType _fluroTransitionType(RouteTransitionType type) {
    return TransitionType.values[type.index];
  }
}
