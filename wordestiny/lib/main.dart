import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wordestiny/generated/l10n.dart';
import 'package:wordestiny/pages/splash_page.dart';
import 'package:wordestiny/styles/theme.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List _wordList = [];
  // This widgets is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false, //去掉右上角debug
      theme: theme,
      //国际化支持
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // 设置中文为首选项
      supportedLocales: [
        const Locale('zh', ''),
        ...S.delegate.supportedLocales
      ],
      // home: new AboutPage(),
      home: SplashPage(), // 闪屏页
//       home:HistoryPage()
      // supportedLocales: S.delegate.supportedLocales,
    );
  }
}
