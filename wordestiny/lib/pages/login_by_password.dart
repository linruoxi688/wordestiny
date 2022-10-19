import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/ciyu_logo.dart';
import 'package:wordestiny/widgets/input.dart';
import 'package:wordestiny/widgets/custom_button.dart';
import 'package:wordestiny/pages/login_by_verificationcode.dart';
class PasswordLoginPage extends StatefulWidget {
  const PasswordLoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const PasswordLoginPage());
  }

  @override
  _PasswordLoginPageState createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> {
  var _phoneNumberController = new TextEditingController();
  var _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: SingleChildScrollView(
            child: (Column(
              children: <Widget>[
                SizedBox(height: 140),
                CiyuLogo(size: 156),
                //最上方图标层
                SizedBox(height: 48),
                InputBox.phone(hintext: "手机号"),
                //手机号输入框
                SizedBox(height: 22),
                InputBox.password(hintext: "密码"),
                //密码输入框
                SizedBox(height: 16),
                _buildLinkButton(context, title: "验证码登录", onTap:()=> Navigator.of(context).pushReplacement(VerificationCodeLoginPage.route()),),
                //转为验证码登录按钮
                SizedBox(height: 48),
                CustomButton.accent(
                    child: Text("登录 / 注册", style: textTheme.headline6),
                    onPressed: () => {}),
                //登录按钮
              ],
            )),
          ),
        ));
  }
}

Widget _buildLinkButton(BuildContext context,
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

// void login() {
//   Http().post(
//     "/v1/user/login",
//     parameters: {
//       "mobile": "15513296485",
//       "passwd": "12345678",
//       "loginType": "userName"
//     },
//     onSuccess: (apis) {
//       Login login = LoginResult.fromJson(apis).apis;
//       print(login.accessToken);
//       print(login.refreshToken);
//       print("登陆成功");
//       status = true;
//     },
//     onError: (error) {
//       print("error");
//     },
//   );
// }

void loginFailed() {}
