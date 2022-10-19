import 'package:flutter/material.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/custom_button.dart';
class ArticleFeedBackPage extends StatefulWidget {
  const ArticleFeedBackPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ArticleFeedBackPage());
  }
  @override
  _ArticleFeedBackPageState createState() => _ArticleFeedBackPageState();
}

class _ArticleFeedBackPageState extends State<ArticleFeedBackPage> {
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
          SizedBox(height: 10),
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
              DropdownMenuItem(value: "FB210", child: Text('其他')),
              DropdownMenuItem(value: "FB200", child: Text('违法违禁')),
              DropdownMenuItem(value: "FB201", child: Text('色情')),
              DropdownMenuItem(value: "FB202", child: Text('低俗')),
              DropdownMenuItem(value: "FB203", child: Text('赌博诈骗')),
              DropdownMenuItem(value: "FB204", child: Text('血腥暴力')),
              DropdownMenuItem(value: "FB205", child: Text('人身攻击')),
              DropdownMenuItem(value: "FB206", child: Text('与应用内其他文章撞车')),
              DropdownMenuItem(value: "FB207", child: Text('不良封面/标题')),
              DropdownMenuItem(value: "FB208", child: Text('分类错误')),
              DropdownMenuItem(value: "FB209", child: Text('青少年不良信息')),
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

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      child: Text(
        "反馈类型",
        textAlign: TextAlign.left,
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
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  var userid;
  var status;
  // void articleFeedBack() {
  //   Http().post("/v1/article/feedback", parameters: {
  //     "accessToken": "IhavenoToken",
  //     // "userId": userid,
  //     "feedbackId": value,
  //     "content": msg,
  //     "articleId": id,
  //     "pics": null,
  //   }, onSuccess: (apis) {
  //     FeedBackCommitResult feedBackCommit = FeedBackCommitResult.fromJson(apis);
  //     status = feedBackCommit.msg;
  //     print(status);
  //   }, onError: (error) {
  //     print("error");
  //   });
  // }
}
