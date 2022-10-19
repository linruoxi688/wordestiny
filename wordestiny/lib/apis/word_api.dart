class WordApi extends BaseApi {
  static final WordApi _instance = WordApi._();

  WordApi._()
      : super();

  factory WordApi() {
    return _instance;
  }

  Future<WordBankModel> getWordBank({// 获取生词本列表
    required String accessToken,
    required int page,
    required int limit,
  }) async {
    final url = '/v1/word/bank';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
        "page":page,
        "limit":limit,
      });
      return WordBankModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting WordBank from WordApi.\n$url');
      throw Exception(
          'Error getting WordBank from WordApi.\n$url\n$e');
    }
  }


  Future<void> removeWordBank({//  删除生词本中的某个单词
    required String accessToken,
    required List<String> wordId,
  }) async {
    final url = '/v1/word/bank';
    try {
      final response = await dio.delete(url, data: {
        "accessToken":accessToken,
        "wordId":wordId,
      });
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}removing WordBank from WordApi.\n$url');
      throw Exception(
          'Error removing WordBank from WordApi.\n$url\n$e');
    }
  }

  Future<void> addWordBank({  //  添加单词进生词本
    required String accessToken,
    required String wordId,
    required bool meet,
    required String dateTime,
    required String sentenceId,
    required int wordIndex,
  }) async {
    final url = '/v1/word/bank';
    try {
    } on Exception catch (e) {
      final response = await dio.post(url, data: {
        "accessToken":accessToken,
        "wordId":wordId,
        "meet":meet,
        "dateTime":dateTime,
        "sentenceId":sentenceId,
        "wordIndex":wordIndex
      });
      logger.e('Error ${e
          .toString()}adding WordBank from WordApi.\n$url');
      throw Exception(
          'Error adding WordBank from WordApi.\n$url\n$e');
    }
  }

  Future<WordBankWordModel> getWordBankWord({  //  获取单词本中单词的释义
    required String accessToken,
    required String wordId
  }) async {
    final url = '/v1/word/bankById';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
        "wordId":wordId
      });
      return WordBankWordModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting WordBankWord from WordApi.\n$url');
      throw Exception(
          'Error getting WordBankWord from WordApi.\n$url\n$e');
    }
  }

  Future<ArticleWordModel> getArticleWord({  //  获取文章中单词的释义
    required String accessToken,
    required String wordContent
  }) async {
    final url = '/v1/word/dict';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
        "wordContent":wordContent
      });
      return ArticleWordModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting ArticleWord from WordApi.\n$url');
      throw Exception(
          'Error getting ArticleWord from WordApi.\n$url\n$e');
    }
  }

  Future<RemixWordModel> getRemixWord({  //  混合查找单词本中和文章中单词的释义
    required String accessToken,
    required String word,
    required int limit
  }) async {
    final url = '/v1/word/bankById';
    try {
      final response = await dio.get(url, parameters: {
        "accessToken":accessToken,
        "word":word,
        "limit":limit
      });
      return RemixWordModel.fromJson(response.data);
    } on Exception catch (e) {
      logger.e('Error ${e
          .toString()}getting RemixWord from WordApi.\n$url');
      throw Exception(
          'Error getting RemixWord from WordApi.\n$url\n$e');
    }
  }
}