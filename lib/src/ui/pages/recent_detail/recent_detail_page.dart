import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/movie_provider.dart';
import 'package:watch_movie_app/src/ui/global_widgets/fake_video.dart';

class RecentDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int movieIdSelect =
        ref.watch(airTodayMovieIdSelectProvider.state).state ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: ref.watch(movieDetailProvider(movieIdSelect)).when(
              data: (data) => Text(data.originalName),
              error: (e, s) => const Text('Error'),
              loading: () =>
                  const CircularProgressIndicator(color: Colors.white),
            ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPaddingHorizontal,
            ),
            child: ref.watch(movieDetailProvider(movieIdSelect)).when(
                  data: (movieDetail) => ListView.separated(
                    itemBuilder: (context, i) {
                      Seasons season = movieDetail.seasons[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            '${season.seasonNumber + 1} Season',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          FakeVideo(networkImage: season.posterPath),
                        ],
                      );
                    },
                    separatorBuilder: (_, __) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Divider(color: lightColor),
                    ),
                    itemCount: movieDetail.seasons.length,
                  ),
                  error: (e, s) => const Text("error"),
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )),
      ),
    );
  }
}
