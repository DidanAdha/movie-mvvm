
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "https://api.themoviedb.org/3/search/movie?"
        "api_key=8f7919c3578bc13ab5577ff2c1acc781"
        "&language=en-US"
        "&query=$keyword"
        "&page=1"
        "&include_adult=true";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["results"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  String getImageUrl(String path){
    return "https://image.tmdb.org/t/p/w500/"+path;
  }
}