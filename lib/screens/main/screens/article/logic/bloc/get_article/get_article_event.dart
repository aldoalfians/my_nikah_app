part of 'get_article_bloc.dart';

abstract class GetArticleEvent extends Equatable {
  const GetArticleEvent();

  @override
  List<Object> get props => [];
}

class ArticleListStarted extends GetArticleEvent {}
