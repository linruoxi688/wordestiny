import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/utils/no_splash_factory.dart';

CiyuTextTheme get textTheme {
  return const CiyuTextTheme(
    headline1: TextStyle(),
    headline2: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    paragraph: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    paragraphBold: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    subtitle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    normal: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    normalSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    normalSmallBold: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    normalSmallHeavy: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    normalBold: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    normalBig: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    small: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    smallBold: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    tiny: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
    tinyBold: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    // bodyText1: TextStyle(fontSize: 16),
    // bodyText2: TextStyle(fontSize: 14),
    // subtitle1: TextStyle(fontSize: 12),
    // caption: TextStyle(fontWeight: FontWeight.w700),
    // button: TextStyle(),
    // subtitle2: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
  ).apply(
    fontFamily: 'OPPOSans',
  );
}

class CiyuTextTheme extends TextTheme {
  final TextStyle? paragraph;
  final TextStyle? paragraphBold;
  final TextStyle? subtitle;
  final TextStyle? normal;
  final TextStyle? normalBold;
  final TextStyle? normalSmall;
  final TextStyle? normalSmallBold;
  final TextStyle? normalSmallHeavy;
  final TextStyle? normalBig;
  final TextStyle? small;
  final TextStyle? smallBold;
  final TextStyle? tiny;
  final TextStyle? tinyBold;

  const CiyuTextTheme({
    this.paragraph,
    this.paragraphBold,
    this.subtitle,
    this.normal,
    this.normalBold,
    this.normalSmall,
    this.normalSmallBold,
    this.normalSmallHeavy,
    this.normalBig,
    this.small,
    this.smallBold,
    this.tiny,
    this.tinyBold,
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3,
    TextStyle? headline4,
    TextStyle? headline5,
    TextStyle? headline6,
  }) : super(
          headline1: headline1,
          headline2: headline2,
          headline3: headline3,
          headline4: headline4,
          headline5: headline5,
          headline6: headline6,
        );

  @override
  CiyuTextTheme apply({
    String? fontFamily,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color? displayColor,
    Color? bodyColor,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
  }) {
    return CiyuTextTheme(
      headline1: headline1?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline2: headline2?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline3: headline3?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline4: headline4?.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline5: headline5?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headline6: headline6?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      paragraph: paragraph?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      paragraphBold: paragraphBold?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      subtitle: subtitle?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      normal: normal?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      normalBold: normalBold?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      normalSmall: normalSmall?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      normalSmallBold: normalSmallBold?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      normalSmallHeavy: normalSmallHeavy?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      normalBig: normalBig?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      small: small?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      smallBold: smallBold?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      tiny: tiny?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      tinyBold: tinyBold?.apply(
        color: bodyColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
    );
  }
}

TextTheme _buildTextTheme(TextTheme base, Color displayColor, Color bodyColor) {
  return base.apply(
    fontFamily: 'OPPOSans',
    displayColor: displayColor,
    bodyColor: bodyColor,
  );
}

ThemeData get theme {
  final base = ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme,
  );
  return base.copyWith(
    splashFactory: NoSplashFactory(),
    primaryColor: CustomColors.normal,
    primaryColorLight: CustomColors.white,
    accentColor: CustomColors.vi,
    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
      brightness: Brightness.light,
      color: CustomColors.white,
      elevation: 0,
      textTheme: _buildTextTheme(
          base.textTheme.copyWith(headline6: textTheme.headline5),
          CustomColors.normal,
          CustomColors.normal),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CustomColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      foregroundColor: CustomColors.normal,
    ),
    buttonColor: CustomColors.vi,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: CustomColors.vi,
    ),
    cardColor: CustomColors.card,
    cardTheme: base.cardTheme.copyWith(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: CustomColors.white,
    ),
    scaffoldBackgroundColor: CustomColors.white,
    primaryIconTheme: base.iconTheme.copyWith(
      color: CustomColors.normal,
    ),
    toggleableActiveColor: CustomColors.vi,
    dividerColor: CustomColors.deepGrey,
    textTheme:
        _buildTextTheme(base.textTheme, CustomColors.normal, CustomColors.normal),
    primaryTextTheme: _buildTextTheme(
        base.primaryTextTheme, CustomColors.normal, CustomColors.normal),
    accentTextTheme: _buildTextTheme(
        base.accentTextTheme, CustomColors.normal, CustomColors.normal),
    snackBarTheme: base.snackBarTheme.copyWith(
      backgroundColor: CustomColors.card,
      contentTextStyle: base.textTheme.bodyText1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        fontFamily: 'Rubik',
        color: CustomColors.normal,
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      elevation: 4,
    ),
  );
}
