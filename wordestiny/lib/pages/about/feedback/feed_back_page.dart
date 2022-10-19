import 'package:flutter/material.dart';
import 'package:wordestiny/pages/about/feedback/app_feed_back_page.dart';
import 'package:wordestiny/pages/about/feedback/word_feed_back_page.dart';

import 'article_feed_back_page.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const FeedBackPage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("App反馈"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(AppFeedBackPage.route());
            },
          ),
          ListTile(
            title: Text("文章反馈"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(ArticleFeedBackPage.route());
            },
          ),
          ListTile(
            title: Text("单词反馈"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(WordFeedBackPage.route());
            },
          ),
        ],
      ),
    );
  }
}
