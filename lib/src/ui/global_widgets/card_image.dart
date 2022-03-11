import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/utils/responsive.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;

  const CardImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: responsive.wp(35),
      height: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
