import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';
import 'package:watch_movie_app/src/domain/providers/movie_provider.dart';

class SerieDetailPage extends ConsumerStatefulWidget {
  @override
  _SerieDetailPageState createState() => _SerieDetailPageState();
}

class _SerieDetailPageState extends ConsumerState<SerieDetailPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int movieIdSelect = ref.watch(movieIdSelectProvider.state).state ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('serie'),
        centerTitle: false,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.favorite_outline_outlined,
                  color: Colors.white54),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: ref.watch(movieDetailProvider(movieIdSelect)).when(
                data: (movieDetail) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topBar(movieDetail),
                    fakeVideo(movieDetail),
                    bodyDescription(movieDetail),
                  ],
                ),
                error: (e, s) {
                  print(e.toString());
                  return const Text("error");
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
        ),
      ),
    );
  }

  Widget topBar(MovieExtend movieDetail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: _currentIndex == 0
              ? null
              : () {
                  setState(() {
                    _currentIndex--;
                  });
                },
          child: Text(
            _currentIndex == 0
                ? movieDetail.seasons[0].name
                : movieDetail.seasons[_currentIndex - 1].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: movieDetail.seasons.length - 1 == _currentIndex
              ? null
              : () {
                  setState(() {
                    _currentIndex++;
                  });
                },
          child: Row(
            children: const [
              Text(
                'Next',
                style: TextStyle(color: lightColor, fontSize: 15),
              ),
              Icon(Icons.navigate_next)
            ],
          ),
        )
      ],
    );
  }

  Widget fakeVideo(MovieExtend movieDetail) {
    String _backdropPath = movieDetail.backdropPath ?? '';

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          _backdropPath != ''
              ? Image(
                  image:
                      NetworkImage(domainImageNetwork + 'w500' + _backdropPath))
              : const SizedBox(),
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

  Widget bodyDescription(MovieExtend movieDetail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movieDetail.originalName, style: textWhite),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
              'IMDb: ${movieDetail.score} | ${movieDetail.firstAirDate} | ${movieDetail.seasons[_currentIndex].name}'),
        ),
        Divider(color: lightColor.withOpacity(.3)),
        SizedBox(
          width: double.infinity,
          child: Text(movieDetail.overview),
        )
      ],
    );
  }

  void nextSerie() {}
}
