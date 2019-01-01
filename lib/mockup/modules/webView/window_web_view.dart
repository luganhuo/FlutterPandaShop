import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../../mockup/constants/constant_colors.dart';
import '../../../mockup/constants/constant_fonts.dart';

class WindowWebView extends StatelessWidget {
  final String title;
  final String url;

  const WindowWebView({Key key, this.title = "", @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: Text(
          this.title,
          style: PandaTextStyle.sfui.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colours.white216,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
