import 'package:http/http.dart' as http;

import 'package:watch_movie_app/src/domain/enums/enums.dart';

/// Clase que nos permite hacer peticiones Http
/// usando la libreria http.dar
class HttpRequest {
  final http.Client _httpClient;
  late String? token;

  HttpRequest({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<http.Response> request(
      {required EnumHttpType typeHttp, required String urlApi, data}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri url = Uri.parse(urlApi);
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
