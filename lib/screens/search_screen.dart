import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubits/search_news_cubit/search_news_cubit.dart';
import 'package:my_news_app/utils/app_colors.dart';

import '../widgets/category_news_listview.dart';
import '../widgets/shimmer_listView.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children:[
              TextField(
                onSubmitted: (value){
                  BlocProvider.of<SearchNewsCubit>(context).searchNews(keyword: value);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: Color(0xffd2d4e0),
                  ),
                  hintText: 'Search By Keyword',
                  hintStyle: TextStyle(
                    color: Color(0xffbabdd0),
                  ),
                  contentPadding: EdgeInsets.all(16),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Color(0xffd2d4e0),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Color(0xffd2d4e0),
                      width: 1,
                    ),
                  ),
                ),
              ),
              BlocBuilder<SearchNewsCubit,SearchNewsState>(
                builder: (context,state) {
                  if(state is SearchNewsInitialState){
                    return Center(child: Image.asset('assets/images/start search.jpg'),);
                  } else if (state is SearchNewsLoadingState) {
                    return Center(
                      child: ShimmerListview(),
                    );
                  } else if (state is SearchNewsSuccessfulState) {
                    if(state.articleList.isEmpty){
                      return Center(child: Image.asset('assets/images/Article Not Found.png'),);
                    }else{
                      return CategoryNewsListView(articles:state.articleList);
                    }
                  } else {
                    return Center(
                      child: Image.asset('assets/images/Something Went Wrong.png'),
                    );
                  }
                },),
            ],
          ),
        ),
      ),
    );
  }
}
