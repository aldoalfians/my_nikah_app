part of 'detail_article_bloc.dart';

abstract class DetailArticleEvent extends Equatable {
  const DetailArticleEvent();

  @override
  List<Object> get props => [];
}

class DetailArticlePressed extends DetailArticleEvent {
  final String uuid;
  const DetailArticlePressed({required this.uuid});

  @override
  List<Object> get props => [uuid];
}
