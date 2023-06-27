import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_nikah_booking/screens/main/screens/article/models/detail_article.dart';
import 'package:my_nikah_booking/screens/main/screens/article/repositories/article_repository.dart';

part 'detail_article_event.dart';
part 'detail_article_state.dart';

class DetailArticleBloc extends Bloc<DetailArticleEvent, DetailArticleState> {
  DetailArticleBloc() : super(DetailArticleInitial()) {
    final ArticleRepository articleRepository = ArticleRepository();
    on<DetailArticlePressed>((event, emit) async {
      try {
        emit(DetailArticleLoading());
        final articleDetail =
            await articleRepository.fetchArticleDetail(event.uuid);
        emit(DetailArticleCompleted(articleDetail));
      } catch (e) {
        emit(DetailArticleFailure(error: e.toString()));
      }
    });
  }
}
