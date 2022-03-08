import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/core/constants/constants.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
