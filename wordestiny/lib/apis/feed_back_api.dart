import 'package:wordestiny/apis/base_api.dart';

class FeedBackApi extends BaseApi {
  static final FeedBackApi _instance = FeedBackApi._();

  FeedBackApi._() : super();

  factory FeedBackApi() {
    return _instance;
  }

  Future<void> createAppFeedBack(  //  进行App功能反馈
      {required String accessToken,
      required msg,
      required String feedbackId,
      required String content,
      required List<String> pics}) async {
    final url = '/v1/app/feedback';
    try {
      final response = await dio.post(url, data: {
        "accessToken": accessToken,
        "msg": {
          "feedbackId": feedbackId,
          "content": content,
          "pics": pics,
        }
      });
    } on Exception catch (e) {
      logger.e(
          'Error ${e.toString()}creating AppFeedBack from FeedBackApi.\n$url');
      throw Exception('Error creating AppFeedBack from FeedBackApi.\n$url\n$e');
    }
  }

  Future<void> createArticleFeedBack(  //  进行文章反馈
      {required String accessToken,
      required int articleId,
      required msg,
      required String feedbackId,
      required String content,
      required List<String> pics}) async {
    final url = '/v1/article/feedback';
    try {
      final response = await dio.post(url, data: {
        "accessToken": accessToken,
        "articleId": articleId,
        "msg": {
          "feedbackId": feedbackId,
          "content": content,
          "pics": pics,
        }
      });
    } on Exception catch (e) {
      logger.e(
          'Error ${e.toString()}creating ArticleFeedBack from FeedBackApi.\n$url');
      throw Exception(
          'Error creating ArticleFeedBack from FeedBackApi.\n$url\n$e');
    }
  }

  Future<void> createWordFeedBack(  //  进行单词反馈
      {required String accessToken,
        required int wordId,
        required msg,
        required String feedbackId,
        required String content,
        required List<String> pics}) async {
    final url = '/v1/word/feedback';
    try {
      final response = await dio.post(url, data: {
        "accessToken": accessToken,
        "articleId": wordId,
        "msg": {
          "feedbackId": feedbackId,
          "content": content,
          "pics": pics,
        }
      });
    } on Exception catch (e) {
      logger.e(
          'Error ${e.toString()}creating WordFeedBack from FeedBackApi.\n$url');
      throw Exception(
          'Error creating WordFeedBack from FeedBackApi.\n$url\n$e');
    }
  }

  Future<VersionModel> getVersion({  //  查看版本更新
    required String accessToken,
    required String version
  }) async {
    final url = '/v1/version/agreement';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
        "version":version
      });
      return VersionModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting Version from FeedBackApi.\n$url');
      throw Exception(
          'Error getting Version from FeedBackApi.\n$url\n$e');
    }
  }


}
