import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/cubits/get_news_cubit.dart';

import '../utils/app_colors.dart';

class CategoryListView extends StatefulWidget {
  CategoryListView({super.key});


  final List<String> categories = ['General','Business','Technology','science','Sport','Health','Entertainment'];

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
  int selectedIndex = 0;
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: (){
              setState(() {
                widget.selectedIndex = i;
                BlocProvider.of<GetNewsCubit>(context).getCategorizedNews(category: widget.categories[i].toLowerCase());
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: widget.selectedIndex == i? AppColors.primary:Colors.white,
                border: Border.all(color: Color(0xffe9eafa)),
              ),
              child: Text(
                widget.categories[i],
                style: TextStyle(
                  color: widget.selectedIndex == i? Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, i) {
          return SizedBox(
            width: 5,
          );
        },
        itemCount: widget.categories.length,
      ),
    );
  }
}
