import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordestiny/pages/login_by_password.dart';
import 'package:wordestiny/pages/login_by_verificationcode.dart';
import 'package:wordestiny/pages/recommend.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/ciyu_logo.dart';
import 'package:wordestiny/widgets/custom_button.dart';

class FastLoginPage extends StatefulWidget {
  const FastLoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const FastLoginPage());
  }

  @override
  _FastLoginPageState createState() => _FastLoginPageState();
}

class _FastLoginPageState extends State<FastLoginPage> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 238),
                CiyuLogo(size: 156), //最上方图标层
                SizedBox(
                  height: 48,
                ),
                _loading ? CircularProgressIndicator(color: CustomColors.vi,) : _buildLoginButton(), //登录按钮
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildLinkButton(
                      context,
                      title: "密码登录",
                      onTap:()=>Navigator.of(context).pushReplacement(PasswordLoginPage.route()),
                    ),
                    //转为密码登录按钮
                    _buildLinkButton(
                      context,
                      title: "验证码登录",
                      onTap: ()=>Navigator.of(context).pushReplacement(VerificationCodeLoginPage.route()),
                    ),
                    //转为验证码登陆按钮
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildLoginButton() {
    return CustomButton.accent(
      child: Text("本机一键登录", style: textTheme.headline6),
      onPressed: (){
        setState((){
          _loading = true;
        });
        Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context).pushReplacement(RecommendPage.route()));
      },
    );
    /*

    Container(
      height: 49,
      width: 312,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStateProperty.all<Color>(CustomColors.vi),
            foregroundColor:
                MaterialStateProperty.all<Color>(CustomColors.white)),
        child: Text(
          "本机一键登陆",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        onPressed: () {
          //onGenerateRoute;
        },
      ),
    )
     */
  }

  Widget _buildLinkButton(BuildContext context,
      {required String title, required GestureTapCallback? onTap}) {
    return GestureDetector(
      child: Text(
        title,
        style: textTheme.headline6!.copyWith(color: CustomColors.vi),
      ),
      onTap: onTap,
    );
  }
}
