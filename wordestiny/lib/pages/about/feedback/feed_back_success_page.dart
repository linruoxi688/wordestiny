import 'package:flutter/material.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/custom_button.dart';

class FeedBackSuccessPage extends StatefulWidget {
  const FeedBackSuccessPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const FeedBackSuccessPage());
  }

  @override
  _FeedBackSuccessPageState createState() => _FeedBackSuccessPageState();
}

class _FeedBackSuccessPageState extends State<FeedBackSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('about');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(''), //140
            ),
            SizedBox(height: 26),
            Container(
                child: Center(
              child: Text(
                "反馈成功",
                style:
                    textTheme.headline2!.copyWith(color: CustomColors.deepGrey),
                textAlign: TextAlign.center,
              ),
            )),
            SizedBox(height: 10),
            Container(
              child: Text(
                "感谢你对词遇的关注与支持，我们会认真处理你的反馈，尽快修复和完善功能",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 200),
                child: CustomButton.accent(
                  child: Text(
                    "关闭",
                    style: textTheme.headline6,
                  ),
                  onPressed: () => {},
                )),
          ],
        ),
      ),
    );
  }
}
