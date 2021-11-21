import 'package:movieflutter/movies/services/webservice.dart';

class Movie {

  final String title;
  final String poster;

  Movie({required this.title, required this.poster});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["original_title"],
        poster: Webservice().getImageUrl(json["poster_path"]),
    );
  }

}