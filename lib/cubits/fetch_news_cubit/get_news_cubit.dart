import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_news_app/services/news_service.dart';

import '../../models/article_model.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsLoadingState());

  void getLatestNews() async {
    try {
      emit(GetNewsLoadingState());
      final latestNews = await NewsService().getNews(category: 'general');
      emit(GetNewsSuccessfulState(latestNews));
    } catch (e) {
      emit(GetNewsFailureState(e.toString()));
    }
  }

  void getCategorizedNews({required String category}) async {
    try {
      emit(GetNewsLoadingState());
      final categorizedNews = await NewsService().getNews(category: category);
      emit(GetNewsSuccessfulState(categorizedNews));
    } catch (e) {
      emit(GetNewsFailureState(e.toString()));
    }
  }
}
