import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';

class LatestNewsCard extends StatelessWidget {
  LatestNewsCard({super.key, required this.article});

  ArticleModel article;


  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      width: 320,
      height: 240,
      //color: AppColors.primary,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(article.urlToImage ??
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRnNtXQ3-FIvU4vk8Z0E0QDiwe5i3jpZXE6-EsWpalje4cIQvXgvF5FquiFeNG2adQE4M&usqp=CAU"),
          fit: BoxFit.fill,
          colorFilter: new ColorFilter.mode(
              Colors.grey.withOpacity(0.3), BlendMode.srcOver),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              article.title??'Title',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
                //fontFamily: 'Nunito',
              ),
              maxLines: 3,
            ),
            Text(
              article.description??'Describtion',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                //fontFamily: 'Nunito',
                //fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
