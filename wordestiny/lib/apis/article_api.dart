
import 'package:wordestiny/apis/base_api.dart';

class ArticalApi extends BaseApi{
  static final ArticalApi _instance = ArticalApi._();

  ArticalApi._():super();

  factory ArticalApi(){
    return _instance;
  }

}
