import 'package:flutter/material.dart';
import '../global.dart';
import 'word.dart';

class WordBankPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WordBankPage());
  }

  @override
  _WordBankPageState createState() => _WordBankPageState();
}

class _WordBankPageState extends State<WordBankPage> {
  _bottomDialogOrder() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 240.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('按英文首字母排序'),
                  onTap: () {
                    Navigator.pop(context, 'a');
                  },
                ),
                ListTile(
                  title: Text('按单词收藏时间排序'),
                  onTap: () {
                    Navigator.pop(context, 'b');
                  },
                ),
                ListTile(
                  title: Text('按单词熟练度升序'),
                  onTap: () {
                    Navigator.pop(context, 'c');
                  },
                ),
              ],
            ),
          );
        });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '生词本',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Image(
                fit: BoxFit.cover,
                height: 20.0,
                width: 20.0,
                image: AssetImage("assets/Icon_Sort.png"),
              ),
              onPressed: () {
                _bottomDialogOrder();
              }),
          IconButton(
              icon: Image(
                fit: BoxFit.cover,
                height: 20,
                width: 20,
                image: AssetImage("assets/Icon_Settings.png"),
              ),
              onPressed: () {
                print('StrangeText');
              }),
        ],
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
//47.110.139.226:443
  // void _requestArticle() {
  //   Http().get(
  //     "/v1/word/bank",
  //     parameters: {"accessToken": "IhavenoToken", "pages": 1, "limit": 10},
  //     onSuccess: (apis) {
  //       WordBankResult result = WordBankResult.fromJson(apis);
  //       print(this.word);
  //       setState(() {
  //         this.word = result.apis[0].wordContent;
  //       });
  //     },
  //     onError: (error) {},
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // _requestArticle();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Global.wordList.length,
        itemBuilder: (context, index) {
          return Container(
            child: _buildStrangeWord(Global.wordList[index].keys.toString().substring(1,Global.wordList[index].keys.toString().length-1)),
            //去括号，写的稍为复杂
            padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
          );
        });
  }

  Widget _buildStrangeWord(String word) {
    return Container(
      child: Container(
        height: 35.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Image.asset('assets/bluePoint.png', width: 8.0, height: 8.0),
//            Container(width: 10.0),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
              child: GestureDetector(
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      word,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BackGroud(wordDetail:word),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
