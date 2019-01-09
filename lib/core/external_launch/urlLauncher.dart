import 'dart:async';
import 'dart:core';

import 'package:url_launcher/url_launcher.dart';

class ExternalLauncher {
  static Future<bool> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true);
    } else {
      throw "Could not launch $url";
    }
  }
}
