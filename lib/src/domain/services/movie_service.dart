import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/models/movie.dart';
import 'package:watch_movie_app/src/environment_config.dart';
import 'package:watch_movie_app/src/helpers/movie_api_exception.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);
  return MovieService(config, Dio());
});

class MovieService {
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  MovieService(this._environmentConfig, this._dio);

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
        "${_environmentConfig.domainApi}/${_environmentConfig.apiVersion}/tv/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      );

      if (response.statusCode != 200) {
        throw const MovieApiException('Error al consulta las series populares');
      }

      final results = List<Map<String, dynamic>>.from(response.data['results']);
      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError {
      throw const MovieApiException('Error al consultar la información');
    }
  }

  Future<List<Movie>> getMoviesRecommendations() async {
    try {
      final response = await _dio.get(
        "${_environmentConfig.domainApi}/${_environmentConfig.apiVersion}/tv/top_rated?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1",
      );

      if (response.statusCode != 200) {
        throw const MovieApiException(
            'Error al consulta las series recomendadas');
      }

      final results = List<Map<String, dynamic>>.from(response.data['results']);
      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError {
      throw const MovieApiException('Error al consultar los recomendados');
    }
  }
}
