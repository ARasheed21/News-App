part of 'get_news_cubit.dart';

@immutable
abstract class GetNewsState {}

class GetNewsLoadingState extends GetNewsState {}

class GetNewsSuccessfulState extends GetNewsState{}

class GetNewsFailureState extends GetNewsState{}
