class UserApi extends BaseApi {
  static final UserApi _instance = UserApi._();

  UserApi._()
      : super();

  factory UserApi() {
    return _instance;
  }

  Future<LoginModel> loginByPwd({  //  密码登录
    required String mobile,
    required String loginType,
    String? passwd,
  }) async {
    final url = '/v1/user/login';
    try {
      final response = await dio.post(url, data: {
        "mobile": mobile,
        "loginType": "userName",
        "passwd": passwd,
      });
      return LoginModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting LoginResultResponse from UserApi.\n$url');
      throw Exception(
          'Error getting LoginResultResponse from UserApi.\n$url\n$e');
    }
  }

  Future<LoginModel> authLogin({  //  一键登录By极光的loginToken
    required String mobile,
//    required String loginType,
    required String loginToken,
  }) async {
    final url = '/v1/user/password';
    try {
      final response = await dio.post(url, data: {
        "mobile": mobile,
        "loginType": "mobile",
        "loginToken":loginToken,
      });
      return LoginModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting LoginResultResponse from UserApi.\n$url');
      throw Exception(
          'Error getting LoginResultResponse from UserApi.\n$url\n$e');
    }
  }

  Future<void> changePwd({  //  修改密码
    required String mobile,
    required String formerPassword,
    required String newPassword
  }) async {
    final url = '/v1/user/login';
    try {
      final response = await dio.put(url, data: {
        "mobile": mobile,
        "formerPassword":formerPassword,
        "newPassword":newPassword
      });
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}editing password from UserApi.\n$url');
      throw Exception(
          'Error editing password from UserApi.\n$url\n$e');
    }
  }
}