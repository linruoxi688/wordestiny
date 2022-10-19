import 'package:flutter/material.dart';
import 'package:wordestiny/pages/user_name_setting.dart';
import 'package:wordestiny/pages/user_password_setting.dart';
import 'package:wordestiny/pages/user_phone_setting.dart';

class SettingPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) =>  SettingPage());
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,

        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '个人中心',
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
    return ListView.builder(
        itemCount: 1,
        //itemExtent: 450,
        padding: EdgeInsets.fromLTRB(0,12,0,12),
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: <Widget>[
              //头像框和头像
              Container(
                  height: 170,
                  width: 170,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                          height: 120,
                          width: 120,
                          //padding: EdgeInsets.all(10),
                          child: ClipOval(
                            child:
                            Image.network("https://wx1.sinaimg.cn/large/006YUWj7ly8ft43m7xfr8j30v90v9di9.jpg"),
                          )
                      ),

                    ],
                  )
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              //个人信息设置栏
              InkWell(
                onTap: (){
                  Navigator.push(context, UserNameSettingPage.route());
                },
                child:UserSetting('昵称', '词遇之子'),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, UserPhoneSettingPage.route());
                },
                child:UserSetting('手机', '13365894625'),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, UserPasswordSettingPage.route());
                },
                child:UserSetting('修改密码', ''),
              ),
            ],
          );
        });


  }
}
//个人信息设置组件
class UserSetting extends StatelessWidget{
  UserSetting(this.settingName, this.content);
  var settingName;
  var content;
  //UserNameGetting userNameGetting;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // _requestName();
    return Container(

      padding: EdgeInsets.fromLTRB(10,10,0,12),
      height: 70,
      child: ListTile(
        title: Text(
          settingName,style: TextStyle(fontSize: 22),
        ),

        trailing: Container(
          height: 40,
          width: 170,
          //color: Colors.lightBlue,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children: <Widget>[
              Text(content,
                style: TextStyle(fontSize: 22,color: Color.fromRGBO(0,0,0,0.4)),),
            ],

          ),
        ),
      ),
      // ),



    );
  }
 /*void _requestName() {
    Http http = Http();
    var parameters = {

    };
    http.get("/v1/user/info", parameters: parameters, onSuccess: (name){
      userNameGetting = UserNameGetting.fromJson(name);
    }, onError: (error){

    });

  }*/

}


