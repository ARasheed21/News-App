class ArticleModel {
  final String? title;
  final String? author;
  final String? content;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;

  ArticleModel({
    required this.title,
    required this.author,
    required this.content,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map jsonData) {
    return ArticleModel(
      title: jsonData['title'],
      author: jsonData['author'],
      content: updatedContent(jsonData['content']),
      description: jsonData['description'],
      url: jsonData['url'],
      urlToImage: jsonData['urlToImage'],
      publishedAt: jsonData['publishedAt'].toString().substring(0,10),
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
