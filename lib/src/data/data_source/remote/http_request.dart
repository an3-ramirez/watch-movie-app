import 'package:http/http.dart' as http;

import 'package:watch_movie_app/src/data/data_source/local/local.dart';
import 'package:watch_movie_app/src/data/enums/enums.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';

/// Clase que nos permite hacer peticiones Http
/// usando la libreria http.dar
class HttpRequest {
  final http.Client _httpClient;
  late String? token;

  HttpRequest({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<http.Response> request(
      {required EnumHttpType typeHttp, required String urlApi, data}) {
    token = LocalStore().read(tokenKey);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers = {'Authorization': 'Bearer $token', ...headers};
    }
    var url = Uri.parse(urlApi);
    switch (typeHttp) {
      case EnumHttpType.post:
        return _httpClient.post(url, body: data, headers: headers);
      case EnumHttpType.get:
        return _httpClient.get(url, headers: headers);
      case EnumHttpType.patch:
        return _httpClient.patch(url, headers: headers);
      case EnumHttpType.put:
        return _httpClient.put(url, headers: headers);
      case EnumHttpType.delete:
        return _httpClient.delete(url, headers: headers);
      default:
        return _httpClient.get(url);
    }
  }
}
