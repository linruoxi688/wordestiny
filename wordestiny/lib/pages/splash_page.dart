import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordestiny/pages/fast_login_page.dart';
import 'package:wordestiny/widgets/ciyu_logo.dart';


class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: CiyuLogo(size: 150),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

// 倒计时
  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, navigateToFastLoginPage);
  }

  void navigateToFastLoginPage() {
    Navigator.of(context).pushReplacement(FastLoginPage.route());
  }
}
