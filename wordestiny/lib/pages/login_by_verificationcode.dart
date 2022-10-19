import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/ciyu_logo.dart';
import 'package:wordestiny/widgets/input.dart';
import 'package:wordestiny/widgets/custom_button.dart';
import 'package:wordestiny/pages/login_by_password.dart';
class VerificationCodeLoginPage extends StatefulWidget {
  const VerificationCodeLoginPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const VerificationCodeLoginPage());
  }
  @override
  _VerificationCodeLoginPageState createState() =>
      _VerificationCodeLoginPageState();
}

var _phoneNumber = new TextEditingController();
var _verifyCode = new TextEditingController();
var phoneNumber = _phoneNumber.text;
var verifyCode = _verifyCode.text;

class _VerificationCodeLoginPageState extends State<VerificationCodeLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: (Column(
              children: <Widget>[
                SizedBox(height: 140),
                CiyuLogo(size: 156), //最上方图标层
                SizedBox(height: 48),
                InputBox.phone(hintext: "手机号",), //手机号输入框
                SizedBox(height: 22),
                InputBox.phone(hintext: "验证码",), //验证码输入框
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildLinkButton(context, title: "密码登录", onTap:()=>Navigator.of(context).pushReplacement(PasswordLoginPage.route()),),
                      _buildLinkButton(context, title: "获取验证码", onTap: null),
                    ],
                  ),
//                  child: _buildLinkButton(context, title: "验证码登录", onTap: null),
                ),
                SizedBox(height: 48),
                CustomButton.accent(child: Text("登录 / 注册", style: textTheme.headline6),
                    onPressed: () => {}) //登录按钮
              ],
            )),
          ),
        ));
  }

  Container _buildLinkButton(BuildContext context,
      {required String title, required GestureTapCallback? onTap}) {
    return Container(
//      height: 30,
//      margin: EdgeInsets.fromLTRB(120, 0, 0, 0),
      child: GestureDetector(
        child: Text(
          title,
          style: textTheme.headline6!.copyWith(color: CustomColors.vi),
        ),
        onTap: onTap,
      ),
    );
  }
}

// void login() {
//   Http().post("/v1/user/login", parameters: {
//     "mobile": phoneNumber,
//     "verifyToken": verifyCode,
//     "loginType": "phoneNumber",
//   }, onSuccess: (apis) {
//     Login login = LoginResult.fromJson(apis).apis;
//     print(login.accessToken);
//   }, onError: (error) {
//     print("error");
//   });
// }

void getVerifyCode() {}
