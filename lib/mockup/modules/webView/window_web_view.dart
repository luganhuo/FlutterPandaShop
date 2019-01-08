import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/constant_fonts.dart';

@immutable
class WindowWebView extends StatelessWidget {
  final String title;
  final String url;

  WindowWebView({Key key, this.title = "", @required this.url}) : super(key: key);

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
          this.title.length > 0 ? this.title : this.url,
          style: PandaTextStyle.polaris.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
          child: WebView(
        onWebViewCreated: _getWebViewController,
        initialUrl: this.url,
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
