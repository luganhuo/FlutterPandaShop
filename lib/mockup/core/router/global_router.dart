import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

class PandaRouter {
  static final Router _router = Router();

  static setupRoute() {
//    _router.define("/webView?url=:url", handler: Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//      return WindowWebView(title: params["title"][0], url: params["url"][0]);
//    }));
  }

  static navigateTo({BuildContext context, String url, TransitionType transitionType = TransitionType.native}) => _router.navigateTo(context, url, transition: transitionType);
}
