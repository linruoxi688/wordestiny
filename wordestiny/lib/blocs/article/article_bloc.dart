import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordestiny/blocs/auth/auth_bloc.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent,ArticleState>{
  AuthBloc authBloc;

  ArticleBloc({required this.authBloc}) : super(ArticleState());

  @override
  Stream<ArticleState> mapEventToState(
      ArticleEvent event,
      ) async* {
    if (event is LoadArticle){
      yield* _mapLoadArticleToState(event,state);
    }
  }

  Stream<ArticleState> _mapLoadArticleToState(
      LoadArticle event, ArticleState state) async* {
    late ArticleModel response;
    try {
    }catch(e){

    }
  }

}