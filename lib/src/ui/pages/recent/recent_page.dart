import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/movie_provider.dart';
import 'package:watch_movie_app/src/routes/routes.dart';
import 'package:watch_movie_app/src/ui/global_widgets/card_image.dart';
import 'package:watch_movie_app/src/ui/global_widgets/custom_app_bar.dart';
import 'package:watch_movie_app/src/utils/responsive.dart';

class RecentPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Responsive responsive = Responsive(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Recent'),
      body: SafeArea(
        child: ref.watch(todayMoviesFutureProvider).when(
              data: (movies) => ListView.separated(
                itemBuilder: (context, index) {
                  Movie movie = movies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPaddingHorizontal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        CardImage(
                          imageUrl: movie.backdropPath,
                          width: responsive.wp(90),
                          heigth: responsive.hp(45),
                        ),
                        _customBody(context, ref, movie),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPaddingHorizontal),
                  child: Divider(color: lightColor),
                ),
                itemCount: movies.length,
              ),
              error: (e, s) => const Text('error'),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
      ),
    );
  }

  Widget _customBody(BuildContext context, WidgetRef ref, Movie movie) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(movie.originalName, style: textWhite),
          ),
          Text('1 Epsodes of ${movie.genreIds.length}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  ref.read(airTodayMovieIdSelectProvider.state).state =
                      movie.id;
                  Navigator.pushNamed(context, Routes.RECENT_DETAIL);
                },
                child: Row(
                  children: const [
                    Text(
                      'Go to view',
                      style: TextStyle(color: accentColor, fontSize: 18),
                    ),
                    Icon(Icons.navigate_next, color: accentColor, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
