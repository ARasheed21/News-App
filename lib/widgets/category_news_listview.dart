import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';

import 'category_news_card.dart';

class CategoryNewsListView extends StatelessWidget {
  CategoryNewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: articles.length,
        itemBuilder: (context, i) {
      return CategoryNewsCard(
        article: articles[i],
      );
    });
  }
}
