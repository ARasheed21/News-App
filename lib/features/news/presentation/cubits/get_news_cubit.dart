import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_news_app/features/news/domain/entity/article_entity.dart';
import 'package:my_news_app/features/news/domain/usecases/fetch_news_usecase.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {

  final FetchNewsUsecase fetchNewsUsecase;

  late List<ArticleEntity> latestNewsList;
  late List<ArticleEntity> categorizedNewsList;
  GetNewsCubit(this.fetchNewsUsecase) : super(GetNewsLoadingState());

  void getLatestNews()async{

      final result = await fetchNewsUsecase('general');

      result.fold(
        (failure) => emit(GetNewsFailureState()),
        (newsList) {
          latestNewsList = newsList;
          emit(GetNewsSuccessfulState());
        },
      );
  }

  void getCategorizedNews({required String category})async{
    try{
      emit(GetNewsLoadingState());
      final result = await fetchNewsUsecase(category);
      result.fold(
        (failure) => emit(GetNewsFailureState()),
        (newsList) {
          categorizedNewsList = newsList;
          emit(GetNewsSuccessfulState());
        },
      );
    }catch(e){
      emit(GetNewsFailureState());
    }
  }
}
