import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_news_app/core/services/news_service.dart';
import 'package:my_news_app/features/news/data/data_source/remote_news_datasource.dart';
import 'package:my_news_app/features/news/data/news_repo/news_repo_impl.dart';
import 'package:my_news_app/features/news/domain/usecases/fetch_news_usecase.dart';
import 'package:my_news_app/features/news/presentation/cubits/get_news_cubit.dart';

final getIt = GetIt.instance;

void setupInjections() {
  // Register external packages
  getIt.registerSingleton<Dio>(Dio());

  // Register services
  getIt.registerSingleton<NewsService>(
    NewsService(getIt<Dio>()),
  );

  // Register data sources
  getIt.registerSingleton<RemoteNewsDataSource>(
    RemoteNewsDataSource(getIt<NewsService>()),
  );

  // Register repositories
  getIt.registerSingleton<NewsRepoImpl>(
    NewsRepoImpl(getIt<RemoteNewsDataSource>()),
  );

  // Register use cases
  getIt.registerSingleton<FetchNewsUsecase>(
    FetchNewsUsecase(newsRepo: getIt<NewsRepoImpl>()),
  );

  // Register cubits
  getIt.registerSingleton<GetNewsCubit>(
    GetNewsCubit(getIt<FetchNewsUsecase>()),
  );
}
