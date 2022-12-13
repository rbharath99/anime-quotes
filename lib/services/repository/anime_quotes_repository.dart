import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_anime_quotes/services/models/anime_quote_model.dart';
import 'package:http/http.dart' as http;

class AnimeQuotesRepository {
  static const baseUrl = 'https://animechan.vercel.app/api/random';

  Future<AnimeQuote> fetchRandomQuote() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      debugPrint('$response');
      return AnimeQuote.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint('$e');
      return const AnimeQuote(
          anime: 'empty', character: 'empty', quote: 'empty');
    }
  }
}
