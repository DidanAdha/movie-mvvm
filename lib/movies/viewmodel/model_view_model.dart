import 'package:flutter/cupertino.dart';

import '../models/movie.dart';
import '../services/webservice.dart';

class MovieListViewModel extends ChangeNotifier {

  List<MovieViewModel> movies = <MovieViewModel>[];

  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }

}

class MovieViewModel {

  final Movie movie;

  MovieViewModel({required this.movie});

  String get title {
    return movie.title;
  }

  String get poster {
    return movie.poster;
  }

}