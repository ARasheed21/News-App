

import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';

import 'latest_news_card.dart';

class LatestNewsListView extends StatelessWidget {
  LatestNewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return LatestNewsCard(article:articles[i]);
        },
        separatorBuilder: (context, i) {
          return SizedBox(
            width: 5,
          );
        },
        itemCount: 5,
      ),
    );
  }
}
