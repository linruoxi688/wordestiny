import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'package:wordestiny/styles/theme.dart';
import 'package:wordestiny/widgets/custom_button.dart';
class AppFeedBackPage extends StatefulWidget {
  const AppFeedBackPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AppFeedBackPage());
  }
  @override
  _AppFeedBackPageState createState() => _AppFeedBackPageState();
}

class _AppFeedBackPageState extends State<AppFeedBackPage> {
  TextEditingController _controller=new TextEditingController();
  String? _value;
  File? _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _upLoadImage(image); //上传图片
    setState(() {
       _image = image;
    });
  }

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
          _buildContentTitle(),
          SizedBox(height: 10),
          _buildContentInput(),
          SizedBox(height: 16),
          _buildTitle("反馈类型"),
          SizedBox(height: 10),
          _buildTypeMenu(),
          SizedBox(height: 10),
          _buildTitle("添加截图"),
          SizedBox(height: 16),
          _buildPics(),
          SizedBox(height: 16),
          _buildUpload(),
          SizedBox(height: 16),
          _buildSubmit(),
        ],
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

  Widget _buildTitle(String title) {
    return Container(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.left,
      ),
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
              DropdownMenuItem(value: "FB103", child: Text('其他')),
              DropdownMenuItem(value: "FB100", child: Text('app有bug')),
              DropdownMenuItem(value: "FB101", child: Text('app可以改善')),
              DropdownMenuItem(value: "FB102", child: Text('希望app增加功能')),
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

  Widget _buildSubmit() {
     return CustomButton.accent(
        child: Text("提交", style: textTheme.headline6),
        onPressed: ()=>{},
     );
  }


  Widget _buildPics() {
    return Container(
      child: _image == null ? Text('No image selected.') : Image.file(_image!),
    );
  }

  Widget _buildUpload() {
    return FloatingActionButton(
      onPressed: getImage,
      tooltip: 'Pick Image',
      child: Icon(Icons.add_a_photo),
    );
  }
}

_upLoadImage(File image) async {
  String path = image.path;
  var name = path.substring(path.lastIndexOf("/") + 1, path.length);

  // FormData formData = new FormData.fromMap({
  //   "file": new MultipartFile.fromFile (new File(path), name)
  // });

  FormData formdata = FormData.fromMap(
      {"file": await MultipartFile.fromFile(path, filename: name)});

  // Dio dio = new Dio();
  // var respone = await dio.post<String>("路径", apis: formdata);
  // if (respone.statusCode == 200) {
  //   Fluttertoast.showToast(
  //       msg: "图片上传成功",
  //       gravity: ToastGravity.CENTER,
  //       textColor: Colors.grey);
  // }
}

var userid;
var status;
// void appFeedBack() {
//   Http().post("/v1/app/feedback", parameters: {
//     "feedbackId": value,
//     "content": msg,
//     "accessToken":
//         "yJUeXBlIjoiSldUIiwidHlwIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJ0b2tlbl9raW5kIjoiQUNDRVNTX1RPS0VOIiwidXNlcl9pZCI6MSwiZXhwIjoxNjE3NDIyMjQ2fQ.OIfUjeDNS7ITAX4Olu1X548vkQiGGbKUT0-wIbirA4U",
//   }, onSuccess: (apis) {
//     FeedBackCommitResult feedBackCommit = FeedBackCommitResult.fromJson(apis);
//     status = feedBackCommit.msg;
//     print(status);
//   }, onError: (error) {
//     print("error");
//   });
// }
