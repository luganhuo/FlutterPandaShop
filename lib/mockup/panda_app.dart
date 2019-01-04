import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/constant_colors.dart';
import 'constants/constant_fonts.dart';
import 'core/theme/disable_splash_effect.dart';
import 'root_window.dart';
import 'translations.dart';

class PandaApp extends StatelessWidget {
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
      theme: ThemeData.light().copyWith(
        splashFactory: const NoSplashFactory(),
        primaryColor: Colours.white246,
        primaryColorLight: Colours.white246,
        primaryColorDark: Colours.black,
        primaryTextTheme: TextTheme(
          title: PandaTextStyle.polaris.copyWith(color: Colours.black, fontWeight: FontWeight.w700, fontSize: 15.0),
        ),
      ),
    );
  }
}
