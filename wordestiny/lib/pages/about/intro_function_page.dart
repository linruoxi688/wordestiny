import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const IntroPage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("词遇1.1.0主要更新"),
            subtitle: Text("03月18日"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            title: Text("词遇1.0主要更新"),
            subtitle: Text("03月18日"),
            trailing: Icon(Icons.keyboard_arrow_right),
          )
        ],
      ),
    );
  }
}
