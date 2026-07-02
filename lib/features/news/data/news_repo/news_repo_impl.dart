import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/core/errors/failure.dart';
import 'package:my_news_app/features/news/data/data_source/remote_news_datasource.dart';
import 'package:my_news_app/features/news/domain/entity/article_entity.dart';
import 'package:my_news_app/features/news/domain/repo/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final RemoteNewsDataSource remoteNewsDataSource;

  NewsRepoImpl(this.remoteNewsDataSource);

  @override
  Future<Either<Failure, List<ArticleEntity>>> fetchNews(String category) async {
    try {
      return Right(await remoteNewsDataSource.fetchNews(category));
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      debugPrint(e.toString());
      return const Left(ServerFailure('An unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> searchNews(String query) async {
    try {
      return Right(await remoteNewsDataSource.searchNews(query));
    } on DioException catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      debugPrint(e.toString());
      return const Left(ServerFailure('An unexpected error occurred.'));
    }
  }
}
