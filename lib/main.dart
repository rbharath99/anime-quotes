import 'package:flutter/material.dart';
import 'package:flutter_anime_quotes/bloc/anime_quotes_bloc.dart';
import 'package:flutter_anime_quotes/services/repository/anime_quotes_repository.dart';
import 'package:flutter_anime_quotes/views/quotes_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Quotes',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RepositoryProvider(
        create: (_) => AnimeQuotesRepository(),
        child: BlocProvider(
          create: (context) => AnimeQuotesBloc(
            animeQuotesRepository: context.read<AnimeQuotesRepository>(),
          ),
          child: const QuotesPage(),
        ),
      ),
    );
  }
}
