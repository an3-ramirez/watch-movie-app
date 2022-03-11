import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/ui/global_widgets/card_image.dart';
import 'package:watch_movie_app/src/ui/global_widgets/round_button.dart';
import 'package:watch_movie_app/src/ui/global_widgets/star_rating.dart';
import 'package:watch_movie_app/src/utils/responsive.dart';

class CardMovieList extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onFavorite;
  final VoidCallback? onWatchNow;
  final bool isFavorite;

  const CardMovieList({
    Key? key,
    required this.movie,
    this.onFavorite,
    this.onWatchNow,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CardImage(imageUrl: movie.fullImageUrl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.name,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
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
                    SizedBox(
                      height: 55,
                      width: responsive.wp(35),
                      //color: Colors.amber,
                      child: RoundButton(
                        onPressed: onWatchNow,
                        textBtn: 'Watch Now',
                        fontWeight: FontWeight.normal,
                        paddingHorizontal: 0,
                        paddingVertical: 8,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: onFavorite,
                      child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isFavorite ? Colors.red : Colors.white54,
                        size: 35,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
