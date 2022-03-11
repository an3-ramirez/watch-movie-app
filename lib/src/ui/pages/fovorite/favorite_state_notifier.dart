import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/models/models.dart';

class FavoriteStateNotifier extends StateNotifier<List<Movie>> {
  FavoriteStateNotifier() : super(const []);

  void addMovie(Movie movie) {
    state = [...state, movie];
  }

  void removeMovie(Movie movie) {
    try {
      state = state.where((element) => element.id != movie.id).toList();
    } on StateError {
      state = [];
    }
  }

  void addOrRemove(Movie movie) {
    if (existMovie(movie)) {
      removeMovie(movie);
    } else {
      addMovie(movie);
    }
  }

  bool existMovie(Movie movie) {
    try {
      state.firstWhere((element) => element.id == movie.id);
      return true;
    } on StateError {
      return false;
    }
  }
}

final StateNotifierProvider<FavoriteStateNotifier, List<Movie>>
    favoriteNotifierProvider =
    StateNotifierProvider((ref) => FavoriteStateNotifier());
