part of 'search_news_cubit.dart';

@immutable
abstract class SearchNewsState {}

class SearchNewsInitialState extends SearchNewsState {}

class SearchNewsLoadingState extends SearchNewsState {}

class SearchNewsSuccessfulState extends SearchNewsState{
  final List <ArticleModel> articleList;

  SearchNewsSuccessfulState({required this.articleList});
}

class SearchNewsFailureState extends SearchNewsState{}
