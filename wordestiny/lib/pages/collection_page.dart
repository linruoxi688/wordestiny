import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordestiny/generated/r.dart';



class CollectionPage extends StatelessWidget {
  String title;
   CollectionPage({Key? key,this.title = '我的收藏'}):super(key:key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) =>  CollectionPage());
  }
  static Route routeHistory() {
    return MaterialPageRoute<void>(builder: (_) =>  CollectionPage(title: "阅读记录",));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          toolbarHeight: 50,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                print('1'); //到时候换成对应页面
              }),
          actions: <Widget>[
            IconButton(
                icon: Image.asset(R.iconSort),
                onPressed: () {
                  // _requestArticle();
                  print('2'); //到时候换成对应页面
                }),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  print('3'); //到时候换成对应页面
                }),
          ],
        ),
        body: Collection());
  }
} //头部导航栏条

class Collection extends StatefulWidget {
  Collection({Key? key}) : super(key: key);

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        //padding: EdgeInsets.fromLTRB(12,16,12,16),
        itemCount: listData.length,
        itemBuilder: (context, index) {
          //padding: EdgeInsets.fromLTRB(12,16,12,16);
          return InkWell(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                  // height: 116,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 69,
                              width: 215,
                              child: Text(
                                listData[index]["title"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  height: 1.15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 18,
                              width: 215,
                              child: Text(
                                listData[index]["author"],
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(0, 0, 0, 0.4)),
                              ),
                            ),
                          ],
                        ),
                        flex: 215,
                      ),
                      SizedBox(
                        width: 16
                      ),
                      Expanded(
                        child: Container(
                            height: 84,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  /*ClipRRect(
                                     borderRadius: BorderRadius.circular(10), // 圆角半径
                                     child: Container(
                                     width: 112,
                                     child: */
                                  image: NetworkImage(listData[index][
                                      "thumbnail"]), /*
                                   ),
                                 ),*/
                                ))),
                        flex: 112,
                      )
                    ],
                  )));
        });
  }
  /*List<Widget> _getdate() {
    var tempList = listData.map((value) {
      return ListTile(
        trailing: //圆角图片
            ClipRRect(
          borderRadius: BorderRadius.circular(10), // 圆角半径
          child: Container(
            width: 112,
            child: Image.network(
              value["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: limitNum,
      itemBuilder: (context,index){
        return this.
      }
      )
      InkWell(
              onTap: (){

              },
              child: Container(
                  padding: EdgeInsets.all(10), //内边距
                  _getdate(), //动态列表的
        );
      )
    )
  }*/
}

//暂时存在的示例
List listData = [
  {
    "title":
    'Hard Truths That Make Life Easier Once You Accept Them',
    "author": 'Needham Carter',
    "imageUrl": 'https://media-image1.baydn.com/c3a27a89d92ce6026b284f825f8405e1250c2d40e812b2c527d584da536251a5.png?x-oss-process=image/quality,Q_80 ',
  },
  {
    "title":
    'Social Anxiety Conditioning Model For Mice',
    "author": 'Harrod Clive',
    "imageUrl": 'https://media-image1.baydn.com/847a5657b69f4e1e20f64a760db5787ff871d036c8d0e03c71eb95f6de5c4d6a.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title":
    'White Cane Safety Day',
    "author": 'Foucs Campbell ',
    "imageUrl": 'https://media-image1.baydn.com/ccaf46a0be27bea835c310573f2152ebfe5d878e91bb90d05b1ab6e2f2ffa4ff.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title":
    'Bidding Astronauts Bon Voyage From Gobi Desert',
    "author": 'Yerkes Adams',
    "imageUrl": 'https://media-image1.baydn.com/fab993d4009ebb570821a5cbfd39c0bc708923fc50e79e2d48642e54880be1d4.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title":
    'The Innocent Moments Of Children With Animals',
    "author": 'Peter Raphael',
    "imageUrl": 'https://media-image1.baydn.com/a8697443cb750b988265d1688c1044dead92d642308f03a3d2164930cb344cc6.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title":
    'Posture Impacts How You Perceive Your Food',
    "author": 'Tate Charles',
    "imageUrl": 'https://media-image1.baydn.com/da0fcfe61b24325052d535590b2fcb674547ce913a79b23720cf30b9b1f01797.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title":
    'To Improve The Quality Of Your Writing? Type Slower',
    "author": 'Howell Oliver',
    "imageUrl": 'https://media-image1.baydn.com/4b31628ede0b0be09c5cdc29cb6bcce026c99d2c626f13e02ca1ac795b8434be.png?x-oss-process=image/quality,Q_80',
  },
];
