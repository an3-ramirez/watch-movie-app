import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/domain/constants/app_constants.dart';

class FakeVideo extends StatelessWidget {
  final String networkImage;
  const FakeVideo({Key? key, required this.networkImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.3),
      height: 200,
      child: Stack(
        children: [
          Center(child: Image(image: NetworkImage(networkImage))),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [iconPlay()],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconPlay() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: accentColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.play_arrow),
    );
  }
}
