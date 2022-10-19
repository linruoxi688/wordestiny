import 'package:flutter/material.dart';


class UserNameSettingPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) =>  UserNameSettingPage());
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,

        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '修改昵称',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,


          ),
          body: HomeContent(),
        ));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 52,),
        Container(
          height: 62,
          width: 312,
          margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: TextField(
            //controller: _phoneNum,
              decoration: InputDecoration(
                hintText: "请输入新昵称",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.32), fontSize: 22),
                //labelText: "手机号",
                //border: OutlineInputBorder(),//边框
              ),
              inputFormatters: [
                // 输入校验，这里只允许输入数字
                //FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                //FilteringTextInputFormatter.digitsOnly
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
              "确认修改",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/recommend');

            },
            color: Color.fromRGBO(127, 139, 217, 1),
            textColor: Colors.white,
          ),
        )
      ],
    );
  }
}
