import 'package:dartz/dartz.dart';
import 'package:my_news_app/core/errors/failure.dart';
import 'package:my_news_app/features/news/domain/entity/article_entity.dart';
import 'package:my_news_app/features/news/domain/repo/news_repo.dart';

class SearchNewsUsecase {

    final NewsRepo newsRepo;
  
    SearchNewsUsecase(this.newsRepo);
  
    Future<Either<Failure, List<ArticleEntity>>> call(String query) async {
      return await newsRepo.searchNews(query);
    }
}