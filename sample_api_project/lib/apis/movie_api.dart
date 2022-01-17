import 'dart:convert';

import 'package:http/http.dart';
import 'package:sample_api_project/models/movie_character.dart';

class MovieApi {
  static Future<List<MovieCharacter>> getMovieCharactersApi() async {
    var response =
        await get(Uri.parse("https://breakingbadapi.com/api/characters"));
    Iterable data = await jsonDecode(response.body);
    var list = data.map((value) => MovieCharacter.fromMap(value)).toList();
    return list;
  }

  static Future<MovieCharacter> getCharacterApi(int id) async {
    var response =
        await get(Uri.parse("https://breakingbadapi.com/api/characters/$id"));
    Iterable data = jsonDecode(response.body);
    var character = data.map((e) => MovieCharacter.fromMap(e)).first;
    return character;
  }
}
