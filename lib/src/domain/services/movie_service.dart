import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/data_source/remote/http_request.dart';
import 'package:watch_movie_app/src/domain/enums/enums.dart';
import 'package:watch_movie_app/src/data/models/models.dart';
import 'package:watch_movie_app/src/environment_config.dart';
import 'package:watch_movie_app/src/helpers/movie_api_exception.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);
  return MovieService(config, HttpRequest());
});

class MovieService {
  final EnvironmentConfig _environmentConfig;
  final HttpRequest _http;

  MovieService(this._environmentConfig, this._http);

  Future<List<Movie>> getMovies() async {
    try {
      String url =
          "${_environmentConfig.domainApi}/${_environmentConfig.apiVersion}/tv/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1";
      final response =
          await _http.request(typeHttp: EnumHttpType.get, urlApi: url);

      if (response.statusCode != 200) {
        throw const MovieApiException('Error al consulta las series populares');
      }

      List<Movie> movies = allMoviesFromJson(response.body);

      return movies;
    } on ClientException {
      throw const MovieApiException('Error al consultar la información');
    }
  }

  Future<List<Movie>> getMoviesRecommendations() async {
    try {
      String url =
          "${_environmentConfig.domainApi}/${_environmentConfig.apiVersion}/tv/top_rated?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1";
      final response =
          await _http.request(typeHttp: EnumHttpType.get, urlApi: url);

      if (response.statusCode != 200) {
        throw const MovieApiException(
            'Error al consulta las series recomendadas');
      }

      List<Movie> movies = allMoviesFromJson(response.body);
      return movies;
    } on ClientException {
      throw const MovieApiException('Error al consultar los recomendados');
    }
  }

  Future<MovieExtend> getDetailMovie(int id) async {
    try {
      String url =
          "${_environmentConfig.domainApi}/${_environmentConfig.apiVersion}/tv/$id?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1";

      final Response response =
          await _http.request(typeHttp: EnumHttpType.get, urlApi: url);

      if (response.statusCode != 200) {
        throw const MovieApiException(
            'Error al consulta el detalle de la serie');
      }

      MovieExtend movieExtend = movieExtendFromJson(response.body);
      return movieExtend;
    } on ClientException {
      throw const MovieApiException(
          'Error al consultar el detalle de la serie');
    }
  }

  Future<List<Movie>> getAirtodayMovies() async {
    try {
      String url =
          "${_environmentConfig.domainApi}/${_environmentConfig.apiVersion}/tv/airing_today?api_key=${_environmentConfig.movieApiKey}&language=en-US&page=1";

      final Response response =
          await _http.request(typeHttp: EnumHttpType.get, urlApi: url);

      if (response.statusCode != 200) {
        throw const MovieApiException(
            'Error al consultar las series, intente nuevamente mas tarde');
      }
      List<Movie> movies = allMoviesFromJson(response.body);
      return movies;
    } on ClientException {
      throw const MovieApiException('Error al consultar las series de hoy');
    }
  }
}
