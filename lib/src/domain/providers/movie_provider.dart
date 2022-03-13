import 'package:flutter_riverpod/flutter_riverpod.dart';

/** Services */
import 'package:watch_movie_app/src/domain/services/movie_service.dart';

/** Models */
import 'package:watch_movie_app/src/data/models/models.dart';

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

final movieDetailProvider =
    FutureProvider.family.autoDispose<MovieExtend, int>((ref, id) async {
  ref.maintainState = true;

  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getDetailMovie(id);
  return movies;
});

final todayMoviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getAirtodayMovies();
  return movies;
});

final movieIdSelectProvider = StateProvider<int?>((ref) => null);
final airTodayMovieIdSelectProvider = StateProvider<int?>((ref) => null);
