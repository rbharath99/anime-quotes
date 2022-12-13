import 'package:json_annotation/json_annotation.dart';

part 'anime_quote_model.g.dart';

@JsonSerializable()
class AnimeQuote {
  final String anime;
  final String character;
  final String quote;

  const AnimeQuote({
    required this.anime,
    required this.character,
    required this.quote,
  });

  factory AnimeQuote.fromJson(Map<String, dynamic> json) => _$AnimeQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeQuoteToJson(this);
}