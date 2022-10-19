import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable{
  const ArticleEvent();
}

class LoadArticle extends ArticleEvent{
  final List<ArticleModel> articles;

  LoadArticle({
    required this.articles,
  });

  @override
  List<Object> get props => [articles];
}

