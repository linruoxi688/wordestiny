import 'package:flutter/material.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/custom_button.dart';
import 'package:wordestiny/styles/custom_colors.dart';
class WordFeedBackPage extends StatefulWidget {
  const WordFeedBackPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const WordFeedBackPage());
  }
  @override
  _WordFeedBackPageState createState() => _WordFeedBackPageState();
}




class _WordFeedBackPageState extends State<WordFeedBackPage> {
  TextEditingController _controller = new TextEditingController();
  String? _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          _buildContentTitle(),
          SizedBox(height: 10),
          _buildContentInput(),
          SizedBox(height: 14),
          _buildTitle(),
          SizedBox(height: 10),
          _buildTypeMenu(),
          SizedBox(height: 15),
          _buildSubmit(),
        ],
      ),
    );
  }

  Widget _buildSubmit() {
    return CustomButton.accent(
      child: Text("提交", style: textTheme.headline6),
      onPressed: ()=>{},
    );
  }

  Widget _buildTypeMenu() {
    return Container(
      child: Row(
        children: [
          DropdownButton<String>(
            hint: new Text('其他'),
            value: _value,
            items: [
              DropdownMenuItem(value: "FB302", child: Text('其他')),
              DropdownMenuItem(value: "FB300", child: Text('单词释义不全')),
              DropdownMenuItem(value: "FB301", child: Text('单词分类有误')),
            ],
            onChanged: (value) {
              //下拉菜单item点击之后的回调
              setState(() {
                _value = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      child: Text(
        "反馈类型",
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildContentInput() {
    return Container(
      child: TextField(
        controller: _controller,

        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(),
          hintStyle:textTheme.normalSmall!.copyWith(color: CustomColors.deepGrey),
          hintText: "请输入8192字以内的问题描述，以便我们提供更好的帮助。",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10.0),
        ),
        maxLines: 6,
      ),
    );
  }

  Widget _buildContentTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            "问题与意见",
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          child: Text(
            "${_controller.toString().length}/8192",
            style: TextStyle(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

// var userid;
// var status;

// void wordFeedBack() {
//   Http().post("/v1/word/feedback", parameters: {
//     "accessToken": "IhavenoToken",
//     // "userId": userid,
//     "feedbackId": _value,
//     "content": msg,
//     "wordId": "1",
//     "pics": null,
//   }, onSuccess: (apis) {
//     FeedBackCommitResult feedBackCommit = FeedBackCommitResult.fromJson(apis);
//     print("success");
//     print(feedBackCommit.code);
//     print(feedBackCommit.apis);
//     // print(feedBackCommit.feedBackStatus);
//   }, onError: (error) {
//     print("error");
//   });
// }
