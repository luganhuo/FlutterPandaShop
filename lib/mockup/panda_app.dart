import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/multi_lang/translations.dart';
import 'features/routes/panda_routes.dart';
import 'root_window.dart';

class PandaApp extends StatefulWidget {
  @override
  PandaAppState createState() => new PandaAppState();
}

class PandaAppState extends State<PandaApp> {
  PandaAppState() {
    PandaFeatures.configureRouters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farfetch',
      home: RootWindow(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: new Locale('zh', 'CN'),
      supportedLocales: [
        // 支持的语言列表
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
      theme: ThemeData.light().copyWith(platform: TargetPlatform.iOS),
    );
  }
}
