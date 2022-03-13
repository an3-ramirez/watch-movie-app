import 'dart:convert';

import 'package:watch_movie_app/src/domain/constants/constants.dart';

List<Movie> allMoviesFromJson(String str) {
  final jsonData = json.decode(str)['results'];
  return List<Movie>.from(jsonData.map((x) => Movie.fromMap(x)));
}

class Movie {
  String backdropPath;
  String firstAirDate,
      name,
      originalLanguage,
      originalName,
      overview,
      posterPath;
  int id, voteCount;
  double voteAverage, popularity;
  List<String> originCountry;
  List<int> genreIds;

  Movie({
    required this.backdropPath,
    required this.firstAirDate,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.originCountry,
    required this.id,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  String get fullImageUrl => posterPath != ''
      ? 'https://image.tmdb.org/t/p/w200/$posterPath'
      : emptyUrlImage;
  double get score => voteAverage / 2;

  factory Movie.fromMap(Map<String, dynamic> parsedJson) {
    List<String> originCountryList =
        parsedJson['origin_country'].cast<String>();
    List<int> genreIdsList = parsedJson['genre_ids'].cast<int>();

    return Movie(
      id: parsedJson['id'],
      backdropPath: parsedJson['backdrop_path'] != null
          ? 'https://image.tmdb.org/t/p/w500/' + parsedJson['backdrop_path']
          : emptyUrlImage,
      firstAirDate: parsedJson['first_air_date'],
      name: parsedJson['name'],
      originalLanguage: parsedJson['original_language'],
      originalName: parsedJson['original_name'],
      overview: parsedJson['overview'],
      posterPath: parsedJson['poster_path'] ?? '',
      originCountry: originCountryList,
      popularity: parsedJson['popularity'].toDouble(),
      voteAverage: parsedJson['vote_average'].toDouble(),
      voteCount: parsedJson['vote_count'],
      genreIds: genreIdsList,
    );
  }

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
