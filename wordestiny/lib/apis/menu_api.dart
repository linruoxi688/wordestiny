import 'dart:ffi';

import 'package:wordestiny/apis/base_api.dart';

class MenuApi extends BaseApi {
  static final MenuApi _instance = MenuApi._();

  MenuApi._()
      : super();

  factory MenuApi() {
    return _instance;
  }

  Future<UserInfoModel> getUserInfo({  //  获取用户信息
    required String accessToken,
  }) async {
    final url = '/v1/user/info';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
      });
      return UserInfoModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting UserInfoResultResponse from MenuApi.\n$url');
      throw Exception(
          'Error getting UserInfoResultResponse from MenuApi.\n$url\n$e');
    }
  }

  Future<void> setUserInfo({  //  设置用户个人信息
    required String accessToken,
    required userVO,
    required String avatar,
    required String uid,
    required int sex,
    required String nickname,
    required String mobile,

  }) async {
    final url = '/v1/user/info';
    try {
      final response = await dio.put(url, data: {
        "accessToken":accessToken,
        "userVO":{
          "avatar":avatar,
          "sex":sex,
          "nickname":nickname,
          "uid":uid,
          "mobile":mobile
        }
      });
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}setting UserInfo from MenuApi.\n$url');
      throw Exception(
          'Error setting UserInfo from MenuApi.\n$url\n$e');
    }
  }

  Future<HistoryModel> getHistory({  //  获取阅读历史记录
    required String accessToken,
    required int page,
    required int limit
  }) async {
    final url = '/v1/article/history';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
        "page":page,
        "limit":limit
      });
      return HistoryModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting History from MenuApi.\n$url');
      throw Exception(
          'Error getting History from MenuApi.\n$url\n$e');
    }
  }

  Future<ColllectionModel> getCollection({  //  获取收藏
    required String accessToken,
    required int page,
    required int limit
  }) async {
    final url = '/v1/article/collection';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
        "page":page,
        "limit":limit
      });
      return CollectionModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting Collection from MenuApi.\n$url');
      throw Exception(
          'Error getting Collection from MenuApi.\n$url\n$e');
    }
  }

  Future<void> deleteCollection({  //  删除收藏
    required String accessToken,
    required Array articleIdList,
  }) async {
    final url = '/v1/read/collect/articles';
    try {
      final response = await dio.delete(url, data: {
        "accessToken":accessToken,
        "articleIdList":articleIdList,
      });
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}delete Collection from MenuApi.\n$url');
      throw Exception(
          'Error delete Collection from MenuApi.\n$url\n$e');
    }
  }

  Future<void> deleteHistory({  //  删除阅读历史记录
    required String accessToken,
    required Array articleIdList,
  }) async {
    final url = '/v1/read/history/articles';
    try {
      final response = await dio.delete(url, data: {
        "accessToken":accessToken,
        "articleIdList":articleIdList,
      });
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}delete History from MenuApi.\n$url');
      throw Exception(
          'Error delete History from MenuApi.\n$url\n$e');
    }
  }

  Future<void> filter({  //  文章筛选
    required String accessToken,
    int minWordCount=-1,
    int maxWordCount=-1,
    int difficultyLevelId=-1
  }) async {
    final url = '/v1/read/filter';
    try {
      final response = await dio.post(url, data: {
        "accessToken":accessToken,
        "minWordCount":minWordCount,
        "maxWordCount":maxWordCount,
        "difficultyLevelId":difficultyLevelId
      });
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}filtering passages from MenuApi.\n$url');
      throw Exception(
          'Error filtering passages from MenuApi.\n$url\n$e');
    }
  }
}