import 'package:flutter/material.dart';
import 'package:my_news_app/screens/webview_screen.dart';
import 'package:my_news_app/utils/app_colors.dart';

import '../models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  final ArticleModel article;
  ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_circle_left_rounded),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage ??
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRnNtXQ3-FIvU4vk8Z0E0QDiwe5i3jpZXE6-EsWpalje4cIQvXgvF5FquiFeNG2adQE4M&usqp=CAU"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 330,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                      top: 100, left: 16, right: 16, bottom: 16),
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        ArticleModel.updatedContent(article.content) ??
                            'Content',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WebViewScreen(url: article.url!);
                              },
                            ),
                          );
                        },
                        child: Text(
                          'read more',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 20,
                child: Container(
                  height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/blur.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          article.publishedAt ?? 'Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        Text(
                          article.title ?? 'Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            fontFamily: 'Nunito',
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          'Published By ${article.author ?? 'Author'}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Nunito',
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/*

Positioned(
                top: 20,
                left: 20,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffc4c0c0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ),
              ),
 */
