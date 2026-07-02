part of 'get_news_cubit.dart';

@immutable
abstract class GetNewsState {}

class GetNewsLoadingState extends GetNewsState {}

class GetNewsSuccessfulState extends GetNewsState {
  final List<ArticleModel> articles;

  GetNewsSuccessfulState(this.articles);
}

class GetNewsFailureState extends GetNewsState {
  final String message;

  GetNewsFailureState(this.message);
}
