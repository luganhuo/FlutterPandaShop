import 'package:flutter/material.dart';
import 'package:flutter_panda_foundation/flutter_panda_foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/route/panda_routable_model.dart';
import '../../features/routes/panda_feature_helper.dart';
//import '../../constants/constant_fonts.dart';

class WindowWebView extends StatefulWidget implements PandaFeatureProviderProtocol {
  final String title;
  final String url;

  WindowWebView({Key key, this.title = "", @required this.url}) : super(key: key);

  static List<PandaRoutableModel> allFeatureRoutes() => [
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
        )
      ];

  @override
  WindowWebViewState createState() => WindowWebViewState();
}

class WindowWebViewState extends State<WindowWebView> {
  WebViewController _controller;

  _getWebViewController(WebViewController webCtrl) {
    assert(_controller != webCtrl);
    _controller = webCtrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.title.length > 0 ? this.widget.title : this.widget.url,
          style: PandaTextStyle.polaris.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
          child: WebView(
        onWebViewCreated: _getWebViewController,
        initialUrl: this.widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
