part of 'get_article_bloc.dart';

abstract class GetArticleState extends Equatable {
  const GetArticleState();

  @override
  List<Object> get props => [];
}

class GetArticleInitial extends GetArticleState {}

class GetArticleLoading extends GetArticleState {}

class GetArticleCompleted extends GetArticleState {
  final GetArticles getArticles;

  const GetArticleCompleted(this.getArticles);

  @override
  List<Object> get props => [getArticles];
}

class GetArticleFailure extends GetArticleState {
  final String error;

  const GetArticleFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "ArticleFailure";
}
