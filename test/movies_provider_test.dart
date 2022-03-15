import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/data/data_source/remote/http_request.dart';
import 'package:watch_movie_app/src/data/models/models.dart';

import 'package:watch_movie_app/src/domain/services/movie_service.dart';
import 'package:watch_movie_app/src/environment_config.dart';

import 'mocks/popular_movies.dart';
import 'movies_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('returns an movies if the http call completes sucessfully', () async {
    final mockHttp = MockClient();
    final container = ProviderContainer(
      overrides: [
        httpClientProvider.overrideWithValue(HttpRequest(httpClient: mockHttp)),
      ],
    );
    addTearDown(container.dispose);

    final environmentConfig = container.read(environmentConfigProvider);
    final movieService = container.read(movieServiceProvider);

    String urlApi =
        "${environmentConfig.domainApi}/${environmentConfig.apiVersion}/tv/popular?api_key=${environmentConfig.movieApiKey}&language=en-US&page=1";
    Uri url = Uri.parse(urlApi);
    when(mockHttp.get(url)).thenAnswer(
      (_) async => http.Response(fakeMovies, 200),
    );

    expectLater(await movieService.getMovies(), isInstanceOf<List<Movie>>());
  });
}
