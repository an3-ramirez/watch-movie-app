import 'dart:convert';

List<Movie> allMoviesFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Movie>.from(jsonData.map((x) => Movie.fromMap(x)));
}

class Movie {
  String? backdropPath;
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
    this.backdropPath,
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

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200/$posterPath';
  double get score => voteAverage / 2;

  factory Movie.fromMap(Map<String, dynamic> parsedJson) {
    List<String> originCountryList =
        parsedJson['origin_country'].cast<String>();
    List<int> genreIdsList = parsedJson['genre_ids'].cast<int>();

    return Movie(
      id: parsedJson['id'],
      backdropPath: parsedJson['backdrop_path'],
      firstAirDate: parsedJson['first_air_date'],
      name: parsedJson['name'],
      originalLanguage: parsedJson['original_language'],
      originalName: parsedJson['original_name'],
      overview: parsedJson['overview'],
      posterPath: parsedJson['poster_path'],
      originCountry: originCountryList,
      popularity: parsedJson['popularity'].toDouble(),
      voteAverage: parsedJson['vote_average'].toDouble(),
      voteCount: parsedJson['vote_count'],
      genreIds: genreIdsList,
    );
  }

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
