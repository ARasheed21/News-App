// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';

// import '../../../data/models/article_model.dart';
// import '../../../../../core/services/news_service.dart';

// part 'search_news_state.dart';

// class SearchNewsCubit extends Cubit<SearchNewsState> {

//     SearchNewsCubit() : super(SearchNewsInitialState());

//   void searchNews({required String keyword})async{
//     try{
//       emit(SearchNewsLoadingState());
//       List<ArticleModel> searchedNewsList = await NewsService(Dio()).searchNews(keyword: keyword);
//       emit(SearchNewsSuccessfulState(articleList: searchedNewsList));
//     }catch(e){
//       emit(SearchNewsFailureState());
//     }
//   }
// }
