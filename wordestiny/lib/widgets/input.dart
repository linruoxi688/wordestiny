import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBox extends TextField{
  const InputBox({
    Key? key,
    TextStyle? style,
    TextEditingController? controller,
    InputDecoration? decoration,
    required bool obscureText,
    List<TextInputFormatter>? inputFormatters,
  }):super(
      key:key,
      style:const TextStyle(fontSize: 22),
      controller: controller,
      decoration: decoration,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
  );

  factory InputBox.phone(
      {
        Key? key,
        TextEditingController? controller,
        InputDecoration? decoration,
        String? hintext,
      })=> InputBox(
      key:key,
      controller: controller,
      obscureText: false,
      inputFormatters: [
            // 输入校验，这里只允许输入数字
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.digitsOnly
          ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(),
        hintText: hintext,
        hintStyle:
        TextStyle(color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
        //labelText: "手机号",
        border: OutlineInputBorder(),
      )
  );

  factory InputBox.password(
      {
        Key? key,
        TextEditingController? controller,
        InputDecoration? decoration,
        String? hintext,
        bool? obscureText,
      })=> InputBox(
      key:key,
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(),
        hintText: hintext,
        hintStyle:
        TextStyle(color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
        border: OutlineInputBorder(),
      )
  );

  factory InputBox.common(
      {
        Key? key,
        TextEditingController? controller,
        InputDecoration? decoration,
        String? hintext,
      })=> InputBox(
      key:key,
      obscureText: false,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(),
        hintText: hintext,
        hintStyle:
        TextStyle(color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
        border: OutlineInputBorder(),
      )
  );
}

//class PhoneNumInputBox extends InputBox {
//  PhoneNumInputBox(TextEditingController controller,String type,String hintext):super(controller,type,hintext){}
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 32),
//      child: TextField(
//          style: TextStyle(fontSize: 22),
//          controller: controller,
//          decoration: InputDecoration(
//            contentPadding: EdgeInsets.all(15),
//            focusedBorder: OutlineInputBorder(),
//            hintText: "手机号",
//            hintStyle:
//                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
//            //labelText: "手机号",
//            border: OutlineInputBorder(),
//          ),
//          inputFormatters: [
//            // 输入校验，这里只允许输入数字
//            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
//            FilteringTextInputFormatter.digitsOnly
//          ]),
//    );
//  }
//}

//class PasswordInputBox extends StatefulWidget {
//  @override
//  _PasswordInputBoxState createState() => _PasswordInputBoxState();
//}

//class _PasswordInputBoxState extends State<PasswordInputBox> {
//  TextEditingController? controller;
//  _PasswordInputBoxState({this.controller});
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 32),
//      child: TextField(
//        style: TextStyle(fontSize: 22),
//        controller: controller,
//        obscureText: true,
//        decoration: InputDecoration(
//          contentPadding: EdgeInsets.all(15),
//          focusedBorder: OutlineInputBorder(),
//          hintText: "密码",
//          hintStyle:
//              TextStyle(color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
//          border: OutlineInputBorder(),
//        ),
//
//      ),
//    );
//  }
//}
//
//class VerifyCodeInputBox extends StatefulWidget {
//  @override
//  _VerifyCodeInputBoxState createState() => _VerifyCodeInputBoxState();
//}
//
//class _VerifyCodeInputBoxState extends State<VerifyCodeInputBox> {
//  TextEditingController? controller;
//  _VerifyCodeInputBoxState({this.controller});
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 32),
//      child: TextField(
//        style: TextStyle(fontSize: 22),
//        controller: controller,
//        obscureText: true,
//        decoration: InputDecoration(
//          contentPadding: EdgeInsets.all(15),
//          focusedBorder: OutlineInputBorder(),
//          hintText: "短信验证码",
//          hintStyle:
//          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
//          border: OutlineInputBorder(),
//        ),
//          inputFormatters: [
//            // 输入校验，这里只允许输入数字
//            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
//            FilteringTextInputFormatter.digitsOnly
//          ]
//      ),
//    );
//  }
//}