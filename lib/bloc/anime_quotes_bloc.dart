import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_anime_quotes/services/models/anime_quote_model.dart';
import 'package:flutter_anime_quotes/services/repository/anime_quotes_repository.dart';
import 'package:flutter_anime_quotes/utils/bloc_status.dart';

part 'anime_quotes_event.dart';
part 'anime_quotes_state.dart';

class AnimeQuotesBloc extends Bloc<AnimeQuotesEvent, AnimeQuotesState> {
  AnimeQuotesBloc({
    required AnimeQuotesRepository animeQuotesRepository,
  }) : _animeQuotesRepository = animeQuotesRepository,
       super(const AnimeQuotesState()) {
          on<FetchAnimeQuote>(_fetchAnimeQuote);
       }

  final AnimeQuotesRepository _animeQuotesRepository;

  Future<void> _fetchAnimeQuote(FetchAnimeQuote event, Emitter<AnimeQuotesState> emit) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));
      final animeQuote = await _animeQuotesRepository.fetchRandomQuote();
      emit(state.copyWith(status: BlocStatus.success, animeQuote: animeQuote));
    } catch (e) {
      debugPrint('$e');
      emit(state.copyWith(status: BlocStatus.error));
    }
  }
}
