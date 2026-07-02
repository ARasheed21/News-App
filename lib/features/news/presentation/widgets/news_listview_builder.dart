import 'package:flutter/material.dart';
import '../../data/models/article_model.dart';


class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({super.key, required this.latestNewsList});

  final List<ArticleModel> latestNewsList;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
