part of 'detail_article_bloc.dart';

abstract class DetailArticleState extends Equatable {
  const DetailArticleState();

  @override
  List<Object> get props => [];
}

class DetailArticleInitial extends DetailArticleState {}

class DetailArticleLoading extends DetailArticleState {}

class DetailArticleCompleted extends DetailArticleState {
  final DetailArticle detailArticle;

  const DetailArticleCompleted(this.detailArticle);

  @override
  List<Object> get props => [detailArticle];
}

class DetailArticleFailure extends DetailArticleState {
  final String error;

  const DetailArticleFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "ArticleFailure";
}
