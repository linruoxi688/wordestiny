import 'package:equatable/equatable.dart';
enum LoadArticleStatus {initial, loading, success, failure}

class ArticleState extends Equatable{

  final LoadArticleStatus load;

  ArticleState({
      this.load = LoadArticleStatus.initial,
});

  @override
  List<Object?> get props => [load];
}
