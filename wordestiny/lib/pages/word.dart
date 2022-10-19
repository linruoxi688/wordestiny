import 'package:flutter/material.dart';


class BackGroud extends StatelessWidget{
  String? wordDetail;
  BackGroud({Key? key,@required this.wordDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              ' 生词详情页',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Image(
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                    image: AssetImage("assets/book.png"),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
            backgroundColor: Colors.white,
          ),
          body: _StrangePage(),
        ));
  }

  Widget _StrangePage() {
    return Column(
      children: [
        _Word(),
        _Explain(),
      ],
    );
  }

  Widget _Word() {
    return Container(
        height: 60.0,
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-0.75, 0.7),
              child: Text(
                '${wordDetail}',
                style: TextStyle(fontSize: 26.0),
              ),
            ),
            Align(
              alignment: Alignment(0.48, 0.7),
              child: Text(
                '熟练度',
                style: TextStyle(fontSize: 12.0, color: Colors.black54),
              ),
            ),
            Align(
              alignment: Alignment(0.83, 0.7),
              child: Text(
                '25',
                style: TextStyle(fontSize: 30.0, color: Colors.blue[700]),
              ),
            ),
          ],
        ));
  }

  Widget _IconStart(String word) {
    return Chip(
      label: Text(word),
      labelStyle: TextStyle(fontSize: 10, color: Colors.blue[500]),
      labelPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  Widget _Explain() {
    return Column(
      children: [
        ListTile(
          leading: _IconStart('释义'),
          title: Text('V.偶然碰到'),
        ),
        ListTile(
          leading: _IconStart('原句'),
          title:
          Text("She was the most remarkable woman he had ever encountered."),
        ),
      ],
    );
  }

}
