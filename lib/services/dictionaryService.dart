import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dictionary_app/models/kelimelerResponse.dart';

class DictionaryService {
  Future<List<String>> searchWord(String word) async {
    var dio = Dio();
    Uri url = Uri.parse('https://sozluk.gov.tr/gts?ara=$word');
    final response = await dio.get(url.toString());

    if (response.statusCode == 200) {
      final result = json.decode(response.data);
      if (result[0] != null) {
        KelimelerResponse kelimelerResponse =
            KelimelerResponse.fromJson(result[0]);
        List<String> anlamlar = [];
        for (AnlamlarList anlam in kelimelerResponse.anlamlarList!) {
          anlamlar.add(anlam.anlam!);
        }
        return anlamlar;
      }
    }
    throw Exception('Bad request');
  }
}
