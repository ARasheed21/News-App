import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/screens/search_screen.dart';
import 'package:my_news_app/utils/app_colors.dart';
import 'package:my_news_app/widgets/category_listview.dart';
import '../cubits/get_news_cubit.dart';
import '../widgets/category_news_listview.dart';
import '../widgets/latest_news_listview.dart';
import '../widgets/shimmer_listView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    //BlocProvider.of<GetNewsCubit>(context).getLatestNews();
    BlocProvider.of<GetNewsCubit>(context)
        .getCategorizedNews(category: 'general');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),

            // SliverToBoxAdapter(
            //     child: LatestNewsListView(articles: latestNewsList)),

            CategoryListView(),

            const SizedBox(height: 8),

            BlocBuilder<GetNewsCubit, GetNewsState>(
              builder: (context, state) {
                if (state is GetNewsLoadingState) {
                  return Center(
                    child: ShimmerListview(),
                  );
                } else if (state is GetNewsSuccessfulState) {
                  List<ArticleModel> categorizedNewsList =
                      BlocProvider.of<GetNewsCubit>(context)
                          .categorizedNewsList;
                  return CategoryNewsListView(articles: categorizedNewsList);
                } else {
                  return Center(
                    child: Image.asset('assets/images/Something Went Wrong.png'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: const SizedBox(height: 16)),
                  // latest news text
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest News',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: const SizedBox(height: 16)),

                  // SliverToBoxAdapter(
                  //     child: LatestNewsListView(articles: latestNewsList)),

                  SliverToBoxAdapter(child: const SizedBox(height: 16)),

                  SliverToBoxAdapter(child: CategoryListView()),

                  SliverToBoxAdapter(child: const SizedBox(height: 8)),

                  CategoryNewsListView(articles: categorizedNewsList),
                ],
              ),
            );
* */

/*
return FutureBuilder<List<ArticleModel>>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if(widget.newsType == 'general'){
            return SliverToBoxAdapter(child: LatestNewsListView(articles: snapshot.data!,));
          }else{
            return CategoryNewsListView(articles: snapshot.data!,);
          }
        }else if(snapshot.hasError){
          return SliverToBoxAdapter(child: Center(child: Text('OOPs Ther is an Error, try again'),));
        }else{
          return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),));
        }
      },
    );
* */
