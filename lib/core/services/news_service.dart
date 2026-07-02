import 'package:dio/dio.dart';

class NewsService{

  final Dio dio;

  NewsService(this.dio);

  Future<Map<String,dynamic>> getNews({required String category})async{
    Response response = await dio.get('https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=bc3817145e964e42b4604a173b3a759a');
    Map<String,dynamic> jsonData = response.data;
    return jsonData;

  }

  Future<Map<String,dynamic>> searchNews({required String keyword})async{
    final Dio dio = Dio();
    Response response = await dio.get('https://newsapi.org/v2/everything?q=$keyword&apiKey=bc3817145e964e42b4604a173b3a759a');
    Map<String,dynamic> jsonData = response.data;
    return jsonData;

  }

}