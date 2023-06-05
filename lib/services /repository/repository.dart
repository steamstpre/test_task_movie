import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task_movie/model/movie_result.dart';

class Repository {
  MovieModel? data;

  Set<MovieResult> favoriteMovie = {};

  Future<void> saveFavoriteMovie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonSet = jsonEncode(favoriteMovie.toList());
    await prefs.setString('favoriteMovie', jsonSet);
  }

  Future<void> getFavoriteMovie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? res = prefs.getString('favoriteMovie');
    if (res != null) {
      List<dynamic> decode = jsonDecode(res);
      favoriteMovie = decode.map((e) => MovieResult.fromJson(e)).toSet();
    }
  }
}
