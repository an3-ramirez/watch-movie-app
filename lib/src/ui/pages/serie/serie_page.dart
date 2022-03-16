import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/providers/movie_provider.dart';
import 'package:watch_movie_app/src/routes/routes.dart';
import 'package:watch_movie_app/src/ui/global_widgets/card_image.dart';
import 'package:watch_movie_app/src/ui/global_widgets/star_rating.dart';
import 'package:watch_movie_app/src/utils/responsive.dart';

import '../../global_widgets/round_button.dart';

class SeriePage extends ConsumerStatefulWidget {
  const SeriePage({Key? key}) : super(key: key);

  @override
  _SeriePageState createState() => _SeriePageState();
}

class _SeriePageState extends ConsumerState<SeriePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular'),
      ),
      body: ref.watch(moviesFutureProvider).when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            data: contentWidget,
            error: (e, s) => const Center(
              child: Text('Error al consultar la informacion'),
            ),
          ),
    );
  }

  Widget contentWidget(List<Movie> movies) {
    Responsive responsive = Responsive(context);

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: responsive.hp(50),
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: movies
              .map(
                (item) => CardImage(
                  imageUrl: item.fullImageUrl,
                  heigth: 105,
                  width: responsive.wp(80),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),
        Text(
          movies[_currentIndex].name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        StarRating(
          alignment: MainAxisAlignment.center,
          color: Colors.grey,
          rating: movies[_currentIndex].score,
          onRatingChanged: (rating) {},
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'IMDb: ${movies[_currentIndex].voteAverage}',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          width: 250,
          child: RoundButton(
              textBtn: 'Watch Now',
              color: Colors.yellow,
              onPressed: () {
                ref.read(movieIdSelectProvider.state).state =
                    movies[_currentIndex].id;
                Navigator.pushNamed(context, Routes.SERIE_DETAIL);
              }),
        )
      ],
    );
  }
}
