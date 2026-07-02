import '../../domain/entity/article_entity.dart';

class ArticleModel extends ArticleEntity {

  ArticleModel({
     super.title,
     super.author,
     super.content,
     super.description,
     super.url,
     super.urlToImage,
     super.publishedAt,
  });

  factory ArticleModel.fromJson(Map jsonData) {
    return ArticleModel(
      title: jsonData['title'],
      author: jsonData['author'],
      content: updatedContent(jsonData['content']),
      description: jsonData['description'],
      url: jsonData['url'],
      urlToImage: jsonData['urlToImage'],
      publishedAt: jsonData['publishedAt'].toString().substring(0,10)
    );
  }

  static String? updatedContent(String? content){
    if (content == null || !content.contains('[')) {
      return content; // Added safety check to prevent substring errors if '[' is missing
    }
    
    int bracketIndex = content.lastIndexOf('[');
    return content.substring(0, bracketIndex).trim();
  }
}
