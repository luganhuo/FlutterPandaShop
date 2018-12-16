import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'root_window.dart';
import 'translations.dart';
import 'core/disable_splash_effect.dart';

class PandaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farfetch',
      home: RootWindow(),
      localizationsDelegates: [
        // 提供地区数据和默认的文字布局
        const TranslationsDelegate(), // 指向默认的处理翻译逻辑的库（后面会讲）
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: new Locale('zh', 'CN'),
      supportedLocales: [
        // 支持的语言列表
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
      theme: ThemeData.light().copyWith(
        splashFactory: const NoSplashFactory(),
      ),
    );
  }
}
