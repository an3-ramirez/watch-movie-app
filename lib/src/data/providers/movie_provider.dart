import 'package:flutter_riverpod/flutter_riverpod.dart';

/** Services */
import 'package:watch_movie_app/src/data/services/movie_service.dart';

/** Models */
import 'package:watch_movie_app/src/data/models/movie.dart';

final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});

final moviesRecomendedFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getMoviesRecommendations();
  return movies;
});
