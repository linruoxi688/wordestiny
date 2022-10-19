import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wordestiny/generated/r.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:vibrate/vibrate.dart';
import '../pages/about/feedback/article_feed_back_page.dart';
import '../global.dart';
import 'package:dio/dio.dart';

Response? res;
var dio = Dio();
Map explain = {};

class ArticlePage extends StatefulWidget {
  final Map<String, String>? each_data;

  @override
  const ArticlePage({Key? key, @required this.each_data}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ArticlePage());
  }

  _ArticlePageState createState() => _ArticlePageState();
}

double kExpandedHeight = 200;

class _ArticlePageState extends State<ArticlePage> {
  ScrollController _scrollController = ScrollController();
  bool _showTitle = false;
  GlobalKey _titleKey = GlobalKey();
  Color _color = Colors.white;
  List<Color> _fontColor = [];
  double _fontSize = 20;
  double _textHeight = 1.5;
  bool _canVibrate = true;
  List keywords = [];

  @override
  void initState() {
    var l = Global.wordList.length;
    for (var i = 0; i < l; i++) {
      var result = Global.wordList[i].keys.toString();
      result = result.substring(1, result.length - 1);
      keywords.add(result); //key是单词，value是熟练度
    }//将Map数组转化成String数组,并且去除外层括号
    super.initState();
    _scrollController.addListener(() {
      final isNotExpanded = _scrollController.hasClients &&
          _scrollController.offset > kToolbarHeight;
      if (isNotExpanded != _showTitle) {
        setState(() {
          // _scrollController.jumpTo(kToolbarHeight);
          _showTitle = isNotExpanded;
        });
      }
    });
    WidgetsBinding.instance!.addPostFrameCallback(_getContainerHeight);
    init();
  }

  init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? print("This device can vibrate")
          : print("This device cannot vibrate");
    });
  }

  void _getContainerHeight(_) {
    setState(() {
      kExpandedHeight =
          _titleKey.currentContext!.size!.height * 1.5 + kToolbarHeight;
    });
    print(kExpandedHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: _buildBody(),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: _buildSetting,
    );
  }

  void _showWordSheet(String _word) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (context) {
          return _buildWordSheet(_word);
        });
  }

  Future searchWord(String _word) async {
    String url = 'http://ghttlab.com:8080/v1/words/$_word';
    res = await dio.get(url);
    Map result = res!.data;
    setState(() {
      explain = result;
    });
  }

  Widget _buildBody() {
    return CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(), //反弹效果
        slivers: <Widget>[
          SliverAppBar(
            // title: Text("hello"),
            actions: <Widget>[
              IconButton(onPressed: null, icon: Icon(Icons.favorite)),
              IconButton(
                  icon: Icon(Icons.add_comment),
                  onPressed: () {
                    Navigator.of(context).push(ArticleFeedBackPage.route());
                  }),
              IconButton(
                  icon: Icon(Icons.settings), onPressed: _showModalBottomSheet),
            ],
            floating: true,
            expandedHeight: _showTitle ? kToolbarHeight : kExpandedHeight,
            title: _showTitle ? Text('${widget.each_data!["title"]}') : null,
            flexibleSpace: _showTitle
                ? null
                : FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    title: _buildTitle(),
                    titlePadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
          ),
          SliverToBoxAdapter(
            child: _buildContent(),
          ),
        ]);
  }

  Widget _buildTitle() {
    return Text(
      "${widget.each_data!["title"]}",
      key: _titleKey,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontFamily: "Times New Roman",
        // fontSize: 30,
      ),
    );
  }

  Widget _buildContent() {
    String _content = "${widget.each_data!["content"]}";
    _content = _content.replaceAll('.', '. ');
    List<InlineSpan> _list = [];
    for (int i = 0; i < _content.split(' ').length; i++) {
      _fontColor.add(Colors.black);
      String word = _content.split(' ')[i]; //拆分单词
      if (word.endsWith(',') ||
          word.endsWith('.') ||
          word.endsWith('?') ||
          word.endsWith('!')) {
        word = word.substring(0, word.length - 1);
      }
      _list.add(
        TextSpan(
          text: _content.split(' ')[i] + ' ',
          recognizer: MultiTapGestureRecognizer(
              longTapDelay: Duration(milliseconds: 500))
            ..onLongTapDown = (pointer, detail) {
              //长按效果
              Vibrate.vibrate();
              //震动
              setState(() {
                _fontColor.replaceRange(i, i + 1, [CustomColors.vi]); //变色
              });
              Global.wordList.add({word: 0}); //加入单词本列表中
//              Global.wordList.forEach((element) {print(element);});
            }
            ..onTapUp = (pointer, detail) {
//              searchWord(word);
              Future.wait([searchWord(word)])
                  .whenComplete(() => _showWordSheet(word));
            },
          style: TextStyle(
//            color: _fontColor[i],
            color: keywords.contains(word) ? CustomColors.vi : _fontColor[i],
            fontStyle: FontStyle.normal,
            fontFamily: "Times New Roman",
          ),
        ),
      );
    }
    return Container(
      color: _color,
      padding: EdgeInsets.all(20),
      child: RichText(
        text: TextSpan(
            children: _list,
            style: TextStyle(
              fontSize: _fontSize,
              height: _textHeight,
            )),
      ),
    );
  }

  Widget _buildExp() {
    List<Widget> tiles = [];
    Widget content;
    for (var item in explain["definitions"]) {
      tiles.add(
        new Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 364,
                child: Text(
                  item,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      );
    }
    content = new Column(children: tiles);
    return content;
  }

  Widget _buildWordSheet(String _word) {
    var like = false;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0.82,
                        child: Text(
                          _word,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: "SF Pro Display",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              like = !like;
                            });
                          },
                          icon: like
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_outline)),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0x1e767680),
                  ),
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 10,
                    top: 4,
                    bottom: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 18,
                        child: Text(
                          "英",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "SF Pro Text",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 90,
                        child: Text(
                          explain['phonetic'][0],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Opacity(
                        opacity: 0.30,
                        child: Container(
                          width: 1,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.50),
                            color: Color(0xff8e8e93),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 18,
                        child: Text(
                          "美",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "SF Pro Text",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 97,
                        child: Text(
                          explain['phonetic'][0],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          _buildExp(),
        ],
      ),
    );
  }

  Widget _buildSetting(BuildContext context) {
    var colors = <Color>[
      CustomColors.card,
      CustomColors.lightVi,
      CustomColors.lightGrey,
      CustomColors.black,
    ];

    var circles = colors
        .map((color) => GestureDetector(
              onTap: () {
                setState(() {
                  _color = color;
                });
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: color == _color
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: CustomColors.vi),
                      )
                    : null,
                child: Center(
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: color,
                  ),
                ),
              ),
            ))
        .toList();

    return Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: circles,
            ),
            SizedBox(height: 16.0),
            Divider(color: CustomColors.lightGrey),
            SizedBox(height: 16.0),
            IntrinsicHeight(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      child:
                          Image.asset(R.size_small, color: CustomColors.grey),
                      onTap: () {
                        print("small");
                        setState(() {
                          _fontSize = 16.0;
                        });
                      },
                    ),
                    GestureDetector(
                      child:
                          Image.asset(R.size_medium, color: CustomColors.black),
                      onTap: () {
                        print("medium");
                        setState(() {
                          _fontSize = 20.0;
                        });
                      },
                    ),
                    GestureDetector(
                      child:
                          Image.asset(R.size_large, color: CustomColors.grey),
                      onTap: () {
                        print("large");
                        setState(() {
                          _fontSize = 24.0;
                        });
                      },
                    ),
                    VerticalDivider(
                        color: CustomColors.lightGrey, thickness: 0.7),
                    GestureDetector(
                      child: Image.asset(R.spacing_small,
                          color: CustomColors.grey),
                      onTap: () {
                        setState(() {
                          _textHeight = 1.2;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(R.spacing_medium,
                          color: CustomColors.black),
                      onTap: () {
                        setState(() {
                          _textHeight = 1.5;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Image.asset(R.spacing_large,
                          color: CustomColors.grey),
                      onTap: () {
                        setState(() {
                          _textHeight = 1.8;
                        });
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

//  String _content =
//      '''We all want our lives to be successful. But "success" looks different for everyone.
//Maybe for you, success means thriving in your career and having financial freedom. For me, it looks like solid friendships and taking care of my mental health. For others, it might be having a happy family life.
//Whatever your definition of success may be, they all ride on a few fundamental truths that are hard to accept. These truths go against what we've been told and the lies fed to us about how life works.
//But the moment you accept these truths about life, everything becomes a whole lot easier.
//Not everyone will like you.
//A friend of mine was recently broken up with by his girlfriend. Even though he was heartbroken, he said there were things about her he didn't like. "She changed her personality based on who she was around," he explained.
//The catch is, my friend's ex saw that as a good trait. According to my friend, his ex explained that her chameleon-like personality made the people around her happier; they liked her more because of it.
//She sacrificed being her authentic self in exchange for people's acceptance. And while it might feel great when people enjoy being around you, it's impossible to have everyone like you.
//So is it worth acting like someone you're not just to gain a few friends who may not even like the real you?
//There will always be someone who is "more," so focus on your lane.
//When you're trying to achieve a goal in life, you'll never succeed if you're constantly looking at what everyone else is doing. You'll always find someone who's more successful/pretty/outgoing.
//The point is: focus on what's happening to you. Don't compare yourself to other people because all that will do is make you feel inadequate. Besides, if you're doing things in a way that's true to you, other people aren't your competition.
//Lean in to what makes you unique, and let that be what gives you the confidence to keep going.
//Your pain isn't unique.
//James Baldwin once wrote, "You think your pain and your heartbreak are unprecedented in the history of the world, but then you read." Every heartbreak, obstacle, or painful experience has been felt by someone before.
//And this isn't to make you feel like you're not special or that you're overreacting; it's to help you realize that you're not alone.
//In a world filled with billions of people, nothing is more lonely than struggling in silence. At the very least, reach out to a friend or research your experience. You'll realize there are people out there who can help you through anything.
//Learning to be alone is one of the hardest but most rewarding things you can do.
//Ask yourself this question: when you come home from running errands and sit down in an empty apartment, what do you do? How do you feel?
//Many people feel anxious. They don't want to be alone, nor do they know how to spend that time. Left alone with their thoughts, they feel more and more horrible about themselves because, the fact is, they don't like themselves.
//And while it might seem unimportant to change things so you can learn to enjoy being alone, it's actually the best gift to give yourself. The person you'll spend the most time with in life is yourself.
//You might as well enjoy your own company.
//You're more likely to become stuck than become unstuck.
//There are a lot of ingredients that go into becoming stuck. Complacency, comfort, laziness, disinterest, confusion, and fear, just to name a few. That's a lot of paths to a single destination.
//But there's only one path towards becoming unstuck, and that's hard work. Change only comes to those who take the necessary steps to create that change. You can't wait around for someone to do it for you.
//That's why it's much easier to become stuck in life and the reason why a lot of people are unhappy. In this case, you can either be part of the majority or be one of the people who beat the odds.
//''';
}
