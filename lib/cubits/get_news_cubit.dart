import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_news_app/services/news_service.dart';

import '../models/article_model.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  late List<ArticleModel> latestNewsList;
  late List<ArticleModel> categorizedNewsList;
  GetNewsCubit() : super(GetNewsLoadingState());

  void getLatestNews()async{
    try{
      latestNewsList = await NewsService().getNews(category: 'general');
      emit(GetNewsSuccessfulState());
    }catch(e){
      emit(GetNewsFailureState());
    }
  }

  void getCategorizedNews({required String category})async{
    try{
      emit(GetNewsLoadingState());
      categorizedNewsList = await NewsService().getNews(category: category);
      emit(GetNewsSuccessfulState());
    }catch(e){
      emit(GetNewsFailureState());
    }
  }
}
