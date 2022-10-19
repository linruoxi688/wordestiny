import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';//计时器

class UserPhoneSettingPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) =>  UserPhoneSettingPage());
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,

        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '修改手机',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,


          ),
          body: HomeContent(),
        ));
  }
}

class HomeContent extends StatelessWidget {
  TextEditingController _phoneNum =TextEditingController();
  TextEditingController _passwordNum =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 52,),
        Container(
          height: 62,
          width: 312,
          margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(child:
                   TextField(
                   controller: _phoneNum,
                     maxLength: 11,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "手机号码",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
                      //labelText: "手机号",
                      //border: OutlineInputBorder(),//边框
                    ),
                    autofocus:  false,
                       inputFormatters: [
                         // 输入校验，这里只允许输入数字
//                         WhitelistingTextInputFormatter(RegExp("[0-9]"))

                       ]),
                  flex: 5,
                ),
                Expanded(
                  child: VercodeTimerWidget(),
                  flex: 1,
                )
              ],
          ),
        ),
        SizedBox(height: 28,),
        Container(
          height: 62,
          width: 312,
          margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: TextField(
            controller: _passwordNum,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: "验证码",

                hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
                //labelText: "手机号",
                //border: OutlineInputBorder(),//边框
              ),
              inputFormatters: [
                // 输入校验，这里只允许输入数字
//                WhitelistingTextInputFormatter(RegExp("[0-9]"))
                
              ]),
        ),
        SizedBox(height: 28,),
        Container(
          height: 49,
          width: 312,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              "下一步",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            onPressed: () {
              _changePhone;

              Navigator.pushNamed(context, '/wslTest');


            },
            color: Color.fromRGBO(127, 139, 217, 1),
            textColor: Colors.white,
          ),
        )
      ],
    );
  }
  void _changePhone(){
    print({'phone':_phoneNum.text,'password':_passwordNum.text});
    if(_phoneNum.text.length!=11){

    }
  }
}

//倒计时类
class VercodeTimerWidget extends StatefulWidget {

  @override
  _VercodeTimerWidgetState createState() => _VercodeTimerWidgetState();
}

class _VercodeTimerWidgetState extends State<VercodeTimerWidget> {
  late Timer _timer;


  //倒计时数值
  var _countdownTime = 0;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      padding: EdgeInsets.only(right: 0),
      child: Text(handleCodeAutoSizeText(),
          style: TextStyle(
              color: Color.fromRGBO(127, 139, 217, 1),
              fontSize: 12)),

      onPressed: () {
        if (_countdownTime == 0) {
          startCountdown();
        }
      },
    );
  }

  String handleCodeAutoSizeText() {
    if (_countdownTime > 0) {
      return '$_countdownTime s';
    } else
      return '重新发送';
  }

  //倒计时方法
  startCountdown() {
    //倒计时时间
    _countdownTime = 60;
    final call = (timer) {
      if (_countdownTime < 1) {
        _timer.cancel();
      } else {
        setState(() {
          _countdownTime -= 1;
        });
      }
    };
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), call);
    }
  }
  //销毁计时器
  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}