import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_nikah_booking/screens/main/screens/article/models/get_articles.dart';
import 'package:my_nikah_booking/screens/main/screens/article/repositories/article_repository.dart';

part 'get_article_event.dart';
part 'get_article_state.dart';

class GetArticleBloc extends Bloc<GetArticleEvent, GetArticleState> {
  GetArticleBloc() : super(GetArticleInitial()) {
    final ArticleRepository articleRepository = ArticleRepository();
    on<ArticleListStarted>((event, emit) async {
      try {
        emit(GetArticleLoading());
        final getArticle = await articleRepository.fetchArticleListData();
        emit(GetArticleCompleted(getArticle));
      } catch (e) {
        emit(GetArticleFailure(error: e.toString()));
      }
    });
  }
}
