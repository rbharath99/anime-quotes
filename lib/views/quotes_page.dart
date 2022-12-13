import 'package:flutter/material.dart';
import 'package:flutter_anime_quotes/bloc/anime_quotes_bloc.dart';
import 'package:flutter_anime_quotes/utils/bloc_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeQuotesBloc, AnimeQuotesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final bloc = context.read<AnimeQuotesBloc>();
        final animeQuote = state.animeQuote;
        final status = state.status;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Anime Quotes'),
          ),
          body: state.status == BlocStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      status == BlocStatus.initial
                          ? Container()
                          : Column(
                              children: [
                                Text(animeQuote.anime),
                                Text(animeQuote.character),
                                Text(animeQuote.quote),
                              ],
                            ),
                      TextButton(
                        onPressed: () => bloc.add(
                          FetchAnimeQuote(),
                        ),
                        child: const Text(
                          'Fetch anime Quote!',
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
