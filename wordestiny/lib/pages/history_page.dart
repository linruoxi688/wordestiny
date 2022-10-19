import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  String title;
  HistoryPage({Key? key,this.title = '我的收藏'}):super(key:key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) =>  HistoryPage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          toolbarHeight: 51,
          leading: IconButton(
              icon: Image(
                fit: BoxFit.cover,
                height: 24,
                width: 24,
                image: AssetImage("image/Icon_Back.png"),
              ),
              onPressed: () {
                print('1'); //到时候换成对应的页面
              }),
          actions: <Widget>[
            IconButton(
                icon: Image(
                  fit: BoxFit.cover,
                  height: 24,
                  width: 24,
                  image: AssetImage("image/Icon_Sort.png"),
                ),
                onPressed: () {
                  print('2'); //到时候换成对应的页面
                }),
            IconButton(
                icon: Image(
                  fit: BoxFit.cover,
                  height: 24,
                  width: 24,
                  image: AssetImage("image/Icon_Settings.png"),
                ),
                onPressed: () {
                  print('3'); //到时候换成对应的页面
                }),
          ],
        ),
        body: Collection());
  }
}

class Collection extends StatefulWidget {
  Collection({Key? key}) : super(key: key);

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  List<Widget> _getdate() {
    var l1 = <Widget>[]; //（声明了一个list类型的变量）(添加动态链表用)
    var i;
    var num = 52; //从后台获取列表文章总数
    for (i = 0; i < num; i++) {
      l1.add(ListTile(
        trailing: //圆角图片
            ClipRRect(
          borderRadius: BorderRadius.circular(10), // 圆角半径
          child: Container(
            width: 112,
            child: Image.network(
              'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm',
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text("这是第$i个"),
        subtitle: Text("by冰冰"),
      ));
    }
    return l1;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10), //内边距
      children: this._getdate(), //动态列表的
    );
  }
}
