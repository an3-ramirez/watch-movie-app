import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/data_source/remote/http_request.dart';
import 'package:watch_movie_app/src/data/models/models.dart';

import 'package:watch_movie_app/src/domain/services/movie_service.dart';
import 'package:watch_movie_app/src/helpers/movie_api_exception.dart';

import 'mocks/popular_movies.dart';

void main() {
  group('get movies', () {
    test('returns an instance of movies if the http call completed sucessfully',
        () async {
      final mockHttp = MockClient((_) async => http.Response(fakeMovies, 200));
      final container = ProviderContainer(
        overrides: [
          httpClientProvider
              .overrideWithValue(HttpRequest(httpClient: mockHttp)),
        ],
      );
      addTearDown(container.dispose);

      final movieService = container.read(movieServiceProvider);

      expectLater(await movieService.getMovies(), isInstanceOf<List<Movie>>());
    });

    test('returns error 404 when calling http', () async {
      final mockHttp = MockClient((_) async =>
          http.Response('{"error": true, "status": "not found"}', 404));
      final container = ProviderContainer(
        overrides: [
          httpClientProvider
              .overrideWithValue(HttpRequest(httpClient: mockHttp)),
        ],
      );
      addTearDown(container.dispose);

      final movieService = container.read(movieServiceProvider);

      expect(() async => await movieService.getMovies(),
          throwsA(isA<MovieApiException>()));
    });

    test('return two movies of the http call', () async {
      final mockHttp = MockClient((_) async => http.Response(fakeMovies, 200));
      final container = ProviderContainer(
        overrides: [
          httpClientProvider
              .overrideWithValue(HttpRequest(httpClient: mockHttp)),
        ],
      );
      addTearDown(container.dispose);

      final movieService = container.read(movieServiceProvider);
      final movies = await movieService.getMovies();

      expect(movies.length, 2);
    });
  });
}
