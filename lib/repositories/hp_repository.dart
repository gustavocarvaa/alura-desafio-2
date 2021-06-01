import 'package:alura_desafio_2/models/character_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CharacterRepo {
  final Client _client;

  CharacterRepo(this._client);

  Future<List<dynamic>> getWizards() async {
    final Response result = await _client
        .get(Uri.parse("https://hp-api.herokuapp.com/api/characters"));

    if (result.statusCode == 200) {
      var response = jsonDecode(result.body)
          .map((value) => CharacterModel.fromJson(value))
          .toList();
      return response;
    } else {
      throw Exception('Ocorreu um erro');
    }
  }
}
