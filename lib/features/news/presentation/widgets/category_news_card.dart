import 'package:flutter/material.dart';
import 'package:my_news_app/features/news/domain/entity/article_entity.dart';
import 'package:my_news_app/features/news/presentation/screens/article_screen.dart';

class CategoryNewsCard extends StatelessWidget {
  const CategoryNewsCard({super.key, required this.article});
  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ArticleScreen(article: article,);
              },
            ),
          );
        },
        child: Container(
          //alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 128,
          //color: AppColors.primary,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(article.urlToImage ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRnNtXQ3-FIvU4vk8Z0E0QDiwe5i3jpZXE6-EsWpalje4cIQvXgvF5FquiFeNG2adQE4M&usqp=CAU"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.grey.withValues(alpha:0.3), BlendMode.srcOver),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.title ?? 'title',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.4,
                    //fontFamily: 'Nunito',
                  ),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article.author ?? 'Author',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        //fontFamily: 'Nunito',
                      ),
                    ),
                    Text(
                      article.publishedAt ?? 'Date',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        //fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
