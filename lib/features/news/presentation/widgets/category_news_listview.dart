import 'package:flutter/material.dart';
import 'package:my_news_app/features/news/domain/entity/article_entity.dart';

import 'category_news_card.dart';

class CategoryNewsListView extends StatelessWidget {
  const CategoryNewsListView({super.key, required this.articles});
  final List<ArticleEntity> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: articles.length,
        itemBuilder: (context, i) {
      return CategoryNewsCard(
        article: articles[i],
      );
    });
  }
}
