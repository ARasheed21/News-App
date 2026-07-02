

import 'package:dartz/dartz.dart';
import 'package:my_news_app/core/errors/failure.dart';

import '../entity/article_entity.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<ArticleEntity>>> fetchNews(String category);
  Future<Either<Failure, List<ArticleEntity>>> searchNews(String query);
}