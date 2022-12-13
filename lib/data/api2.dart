import 'dart:convert';

import 'package:dio/dio.dart';

class Api2 {
  final headers = {
    'x-hasura-admin-secret':
        'kepxLjG9IejMlqgVQ71Q02HY8T0lXWVI389QCq42q1PkRKbGTBDGYmL4VGIKZCmA',
    'content-type': 'application/json'
  };
  final dio = Dio();

  Future<List<dynamic>> getAnnouncements2() async {
    dio.options.headers = headers;
    final result =
        await dio.get('https://loyal-gnat-47.hasura.app/api/rest/anuncios');

    return result.data['anuncio'];
  }

  Future<void> postAnnouncements2(
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
      await dio.post('https://loyal-gnat-47.hasura.app/api/rest/anuncio',
          data: json.encode(body));
    } catch (e) {}
  }
}
