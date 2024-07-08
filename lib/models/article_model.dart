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
      content: jsonData['content'],
      description: jsonData['description'],
      url: jsonData['url'],
      urlToImage: jsonData['urlToImage'],
      publishedAt: jsonData['publishedAt'].toString().substring(0,10),
    );
  }

  static String? updatedContent(String? content){

    if(content == null){
      return null;
    }
    // Find the index of the last occurrence of the opening square bracket "[".
    int bracketIndex = content.lastIndexOf('[');

    // Remove the last part of the string starting from the opening bracket.
    String updatedContent = content.substring(0, bracketIndex).trim();

    return updatedContent;
  }
}
