import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/screens/search_screen.dart';
import 'package:my_news_app/utils/app_colors.dart';
import 'package:my_news_app/widgets/category_listview.dart';
import '../cubits/fetch_news_cubit/get_news_cubit.dart';
import '../widgets/category_news_listview.dart';
import '../widgets/shimmer_list_view.dart';

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
        title: const Text(
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
                    return const SearchScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search_rounded, color: Colors.white),
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

            BlocConsumer<GetNewsCubit, GetNewsState>(
              listener: (context, state) {
                if (state is GetNewsFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red.shade700,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is GetNewsLoadingState) {
                  return const Center(
                    child: ShimmerListview(),
                  );
                } else if (state is GetNewsSuccessfulState) {
                  return CategoryNewsListView(articles: state.articles);
                } else if (state is GetNewsFailureState) {
                  return Center(
                    child:
                        Image.asset('assets/images/Something Went Wrong.png'),
                  );
                }

                return const SizedBox.shrink();
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
