import 'package:flutter/material.dart';
import 'package:movieflutter/movies/movies.dart';
import 'package:movieflutter/movies/widgets/movie_list.dart';
import 'package:provider/provider.dart';

import 'movies/viewmodel/model_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies",
        home:
        ChangeNotifierProvider(
          create: (context) => MovieListViewModel(),
          child: Movies(),
        )
    );
  }
}
