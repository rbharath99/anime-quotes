part of 'anime_quotes_bloc.dart';

class AnimeQuotesState extends Equatable {
  const AnimeQuotesState({
    this.status = BlocStatus.initial,
    this.animeQuote = const AnimeQuote(anime: 'empty', character: 'empty', quote: 'empty'),
  });

  final BlocStatus status;
  final AnimeQuote animeQuote;

  AnimeQuotesState copyWith({
    BlocStatus? status,
    AnimeQuote? animeQuote,
  }) {
    return AnimeQuotesState(
      animeQuote: animeQuote ?? this.animeQuote,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, animeQuote];
}
