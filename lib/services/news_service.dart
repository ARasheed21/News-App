import 'package:dio/dio.dart';

import '../models/article_model.dart';

class NewsService {
  Future<List<ArticleModel>> getNews({required String category}) async {
    final Dio dio = Dio();
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=bc3817145e964e42b4604a173b3a759a');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> jsonArticles = jsonData['articles'];

    return jsonArticles
        .map((article) => ArticleModel.fromJson(article))
        .where((articleModel) => articleModel.author != null)
        .toList();
  }

  Future<List<ArticleModel>> searchNews({required String keyword}) async {
    final Dio dio = Dio();
    Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=$keyword&apiKey=bc3817145e964e42b4604a173b3a759a');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> jsonArticles = jsonData['articles'];

    return jsonArticles
        .map((article) => ArticleModel.fromJson(article))
        .where((articleModel) => articleModel.author != null)
        .toList();
  }
}
