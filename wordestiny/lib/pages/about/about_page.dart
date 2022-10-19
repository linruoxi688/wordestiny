import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wordestiny/pages/about/feedback/feed_back_page.dart';
import 'package:wordestiny/pages/about/intro_function_page.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/ciyu_logo.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AboutPage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          _buildLogo(), //图标及其信息
          SizedBox(height: 20),
          _buildAboutList(context), //列表选项
          SizedBox(height: 50),
          _buildNotice(context), //协议层
        ],
      ),
    );
  }
}


  Widget _buildLogo() {
    return Column(
      children: <Widget>[
        CiyuLogo(size:140),
        Container(
          child: Text(
            "词遇",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          child: Text(
            "Version 1.0.01",
            style: textTheme.normal,
          ),
        )
      ],
    );
}


  Widget _buildAboutList(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("功能介绍", style: textTheme.headline6),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).push(IntroPage.route());
          },
        ),
        ListTile(
          title: Text("反馈", style: textTheme.headline6),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).push(FeedBackPage.route());
          },
        ),
        ListTile(
          title: Text("检查新版本", style: textTheme.headline6),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            // update();
          },
        ),
      ],
    );
}


  Widget _buildNotice(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "词遇软件许可及服务协议",
          style:textTheme.small!.copyWith(color: CustomColors.vi),
        ),
        Text(
          "《隐私保护指引》",
          style:textTheme.small!.copyWith(color: CustomColors.vi),
        ),
        Text(
          "词遇公司 版权所有",
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "Copyright © 2020-2021 Wordestiny",
          style: textTheme.small,
        ),
        Text(
          "All Rights Reserved.",
          style: textTheme.small,
        ),
      ],
    );
}

// _launchURL(url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// void update() {
//   Http().get(
//     "/v1/version/agreement",
//     parameters: {
//       "accessToken": "IhavenoToken",
//       "version": "V001F085B",
//     },
//     onSuccess: (apis) {
//       UpdateResult update = UpdateResult.fromJson(apis);
//       if (update.apis.needed == false) {
//         Fluttertoast.showToast(
//             msg: "已是最新版本！",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 2,
//             backgroundColor: Color.fromRGBO(246, 246, 246, 1),
//             textColor: Color.fromRGBO(127, 139, 217, 1),
//             fontSize: 16.0);
//       } else {
//         Fluttertoast.showToast(
//             msg: "即将跳转到下载页面...",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 2,
//             backgroundColor: Color.fromRGBO(246, 246, 246, 1),
//             textColor: Color.fromRGBO(127, 139, 217, 1),
//             fontSize: 16.0);
//         // _launchURL(update.url);
//       }
//     },
//     onError: (error) {
//       print("error");
//     },
//   );
// }
