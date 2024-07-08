import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubits/get_news_cubit.dart';
import 'package:my_news_app/services/news_service.dart';
import 'package:my_news_app/widgets/category_news_listview.dart';
import 'package:my_news_app/widgets/latest_news_listview.dart';
import '../models/article_model.dart';


class NewsListViewBuilder extends StatelessWidget {
  NewsListViewBuilder({super.key, required this.latestNewsList});

  final List<ArticleModel> latestNewsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
