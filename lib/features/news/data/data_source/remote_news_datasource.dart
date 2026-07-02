import 'package:my_news_app/core/services/news_service.dart';
import 'package:my_news_app/features/news/data/models/article_model.dart';


class RemoteNewsDataSource {
  final NewsService newsService;

  RemoteNewsDataSource(this.newsService);

  Future<List<ArticleModel>> searchNews(String query) async {
    final Map<String, dynamic> jsonData =
        await newsService.searchNews(keyword: query);

    final List<dynamic> jsonArticles = jsonData['articles'];

    return jsonArticles
        .map((article) => ArticleModel.fromJson(article))
        .where((articleModel) => articleModel.author != null)
        .toList();
  }

  Future<List<ArticleModel>> fetchNews(String category) async {
    final Map<String, dynamic> jsonData =
        await newsService.getNews(category: category);

    final List<dynamic> jsonArticles = jsonData['articles'];

    return jsonArticles
        .map((article) => ArticleModel.fromJson(article))
        .where((articleModel) => articleModel.author != null)
        .toList();
  }
}
