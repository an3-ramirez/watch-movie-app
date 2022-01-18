import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/** Providers */
import 'package:watch_movie_app/src/data/providers/movie_provider.dart';

/** Widgets */
import 'package:watch_movie_app/src/ui/global_widgets/round_button.dart';
import 'package:watch_movie_app/src/ui/global_widgets/star_rating.dart';

/** Models */
import 'package:watch_movie_app/src/data/models/movie.dart';

/** Utils */
import 'package:watch_movie_app/src/utils/custom_colors.dart';
import 'package:watch_movie_app/src/utils/custom_styles.dart';
import 'package:watch_movie_app/src/utils/responsive.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Responsive responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                print('logut user');
              },
              child: const Icon(Icons.settings, color: Colors.white54),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15),
        height: responsive.height,
        width: responsive.width,
        decoration: const BoxDecoration(color: CustomColors.black),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title('Popular'),
              ref.watch(moviesFutureProvider).when(
                    error: (e, s) {
                      return const Text("error");
                    },
                    loading: () => SizedBox(
                      height: responsive.hp(35),
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                    data: (movies) => SizedBox(
                      height: responsive.hp(35),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: movies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) {
                          return _carMovie(_, movies[i]);
                        },
                      ),
                    ),
                  ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'See All >',
                    style: TextStyle(
                      fontSize: 22,
                      color: CustomColors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Divider(color: Colors.white70),
              ),
              _title('Recommendations'),
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
                        itemCount: 5,
                        itemBuilder: (_, i) {
                          return _carMovieVertical(_, movies[i]);
                        },
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: CustomStyles.textWhite.copyWith(fontSize: 24),
      ),
    );
  }

  Widget _carMovie(context, Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _imageCard(movie.fullImageUrl),
        ),
        _subTitle(movie.name, 150),
        StarRating(
          rating: movie.score,
          color: Colors.white54,
          size: 15,
          onRatingChanged: (rating) {},
        )
      ],
    );
  }

  Widget _carMovieVertical(context, Movie movie) {
    Responsive responsive = Responsive(context);

    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: _imageCard(movie.fullImageUrl),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subTitle(movie.name, 200),
              StarRating(
                rating: movie.score,
                color: Colors.white54,
                size: 15,
                onRatingChanged: (rating) {},
              ),
              const SizedBox(height: 15),
              const Text(
                'IMDb: 9,4',
                style: TextStyle(color: Colors.white54),
              ),
              Row(
                children: [
                  Container(
                    height: 65,
                    width: responsive.wp(39),
                    //color: Colors.amber,
                    child: RoundButton(
                      textBtn: 'Watch Now',
                      fontWeight: FontWeight.normal,
                      paddingHorizontal: 0,
                      paddingVertical: 8,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white54,
                      size: 40,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Container _imageCard(String url) {
    return Container(
      margin: const EdgeInsets.only(right: 23.0),
      width: 150,
      height: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _subTitle(String text, double width) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: width,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
