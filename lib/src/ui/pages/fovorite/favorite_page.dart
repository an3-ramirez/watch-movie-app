import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/ui/global_widgets/card_movie_list.dart';
import 'package:watch_movie_app/src/ui/global_widgets/custom_app_bar.dart';
import 'package:watch_movie_app/src/ui/pages/fovorite/favorite_state_notifier.dart';

class FavoritePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(favoriteNotifierProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Favorites'),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemCount: movies.length,
          itemBuilder: (_, i) => CardMovieList(
            movie: movies[i],
            onFavorite: () => removeFavorite(movies[i], ref),
            isFavorite: true,
          ),
          separatorBuilder: (_, __) {
            return const Divider(color: Colors.white24);
          },
        ),
      ),
    );
  }

  void removeFavorite(Movie movie, WidgetRef ref) {
    ref.read(favoriteNotifierProvider.notifier).removeMovie(movie);
  }
}
