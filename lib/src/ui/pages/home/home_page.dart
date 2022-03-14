import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/** Providers */
import 'package:watch_movie_app/src/domain/providers/movie_provider.dart';
import 'package:watch_movie_app/src/routes/routes.dart';
import 'package:watch_movie_app/src/ui/global_widgets/card_image.dart';
import 'package:watch_movie_app/src/ui/global_widgets/card_movie_list.dart';
import 'package:watch_movie_app/src/ui/global_widgets/custom_app_bar.dart';

/** Widgets */
import 'package:watch_movie_app/src/ui/global_widgets/star_rating.dart';

/** Models */
import 'package:watch_movie_app/src/data/models/movie.dart';
import 'package:watch_movie_app/src/ui/pages/fovorite/favorite_state_notifier.dart';

import 'package:watch_movie_app/src/utils/utils.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Responsive responsive = Responsive(context);
    final List<Movie> favoriteMovies = ref.watch(favoriteStateProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular',
                  style: textWhite.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: responsive.hp(35),
                  child: ref.watch(moviesFutureProvider).when(
                        error: (e, s) {
                          return const Text("error");
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                        data: (movies) => ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.length > 10 ? 10 : movies.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            return _carMovieHorizontal(_, ref, movies[i]);
                          },
                        ),
                      ),
                ),
                const SizedBox(height: 20),
                iconTextButton(context),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Divider(color: Colors.white70),
                ),
                Text(
                  'Recommendations',
                  style: textWhite.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 20),
                ref.watch(moviesRecomendedFutureProvider).when(
                      error: (e, s) {
                        return const Text("error");
                      },
                      loading: () => SizedBox(
                        height: responsive.hp(35),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                      data: (movies) => SingleChildScrollView(
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.length,
                          itemBuilder: (_, i) {
                            return CardMovieList(
                              movie: movies[i],
                              onFavorite: () => onFavoriteMovie(ref, movies[i]),
                              isFavorite:
                                  isFavorite(ref, movies[i], favoriteMovies),
                              onWatchNow: () =>
                                  navigateDetailPage(context, ref, movies[i]),
                            );
                          },
                        ),
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconTextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, Routes.SERIE),
          child: const Text(
            'See All >',
            style: TextStyle(
              fontSize: 22,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _carMovieHorizontal(BuildContext context, WidgetRef ref, Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3,
          child: CardImage(
            onPress: () => navigateDetailPage(context, ref, movie),
            imageUrl: movie.fullImageUrl,
            heigth: 200,
            width: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 130,
          child: Text(
            movie.name,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        StarRating(
          rating: movie.score,
          color: Colors.white54,
          size: 15,
          onRatingChanged: (rating) {},
        )
      ],
    );
  }

  bool isFavorite(WidgetRef ref, Movie movie, List<Movie> favorites) {
    try {
      favorites.firstWhere((element) => element.id == movie.id);
      return true;
    } on StateError {
      return false;
    }
  }

  void onFavoriteMovie(WidgetRef ref, Movie movie) {
    ref.read(favoriteStateProvider.notifier).addOrRemove(movie);
  }

  void navigateDetailPage(BuildContext context, WidgetRef ref, Movie movie) {
    ref.read(movieIdSelectProvider.state).state = movie.id;
    Navigator.pushNamed(context, Routes.SERIE_DETAIL);
  }
}
