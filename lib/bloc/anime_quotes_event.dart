part of 'anime_quotes_bloc.dart';

abstract class AnimeQuotesEvent extends Equatable {
  const AnimeQuotesEvent();

  @override
  List<Object> get props => [];
}

class FetchAnimeQuote extends AnimeQuotesEvent {}