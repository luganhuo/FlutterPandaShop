import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pandashop/modules/root_window.dart';
import 'package:pandashop/modules/webView/window_web_view.dart';

import 'core/multi_lang/translations.dart';
import 'features/routes/panda_feature_helper.dart';

class PandaApp extends StatefulWidget {
  @override
  PandaAppState createState() => new PandaAppState();
}

class PandaAppState extends State<PandaApp> {
  PandaAppState() {
    PandaFeatureHelper().appendRoute(WindowWebView.allFeatureRoutes());
    PandaFeatureHelper().registerAllRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farfetch',
      home: RootWindow(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: new Locale('zh'),
      supportedLocales: [
        // 支持的语言列表
        const Locale('en'),
        const Locale('zh'),
      ],
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) => locale,
      theme: ThemeData.light().copyWith(platform: TargetPlatform.iOS),
    );
  }
}
