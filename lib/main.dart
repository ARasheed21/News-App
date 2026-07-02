import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/injection.dart';
import 'features/news/presentation/cubits/get_news_cubit.dart';
import 'features/news/presentation/screens/home_screen.dart';

void main() {
  setupInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetNewsCubit>(),
        ),
        // BlocProvider(
        //   create: (context) => SearchNewsCubit(),
        // ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
