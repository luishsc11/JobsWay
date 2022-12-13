import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  final headers = {
    'x-hasura-admin-secret':
        'U8NCZBjMQanTL3PNXvkn9Fsxk4E13BQw0jB74u5KVaOd7dzZfz3oPddWugwtVenp',
    'content-type': 'application/json'
  };
  final dio = Dio();

  Future<List<dynamic>> getAnnouncements() async {
    dio.options.headers = headers;
    final result =
        await dio.get('https://cool-mollusk-57.hasura.app/api/rest/anuncios');

    return result.data['anuncio'];
  }

  Future<void> postAnnouncements(
      {required String titulo,
      required String contato,
      required String descricao}) async {
    dio.options.headers = headers;
    final body = {
      "titulo": titulo,
      "descricao": descricao,
      "contato": contato,
    };
    try {
      await dio.post('https://cool-mollusk-57.hasura.app/api/rest/anuncio',
          data: json.encode(body));
    } catch (e) {}
  }
}
