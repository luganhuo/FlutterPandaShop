import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/constant_fonts.dart';

class WindowWebView extends StatefulWidget {
  final String title;
  final String url;

  WindowWebView({Key key, this.title = "", @required this.url}) : super(key: key);

  @override
  WindowWebViewState createState() {
    return new WindowWebViewState();
  }
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
