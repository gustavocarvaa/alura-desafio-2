import 'package:alura_desafio_2/models/character_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CharacterRepo {
  Future <List<dynamic>> getWizards() async {
    final Response result = await get(Uri.parse("https://hp-api.herokuapp.com/api/characters"));

    if(result.statusCode != 200) {
      throw Exception();
    }
    var response = jsonDecode(result.body).map((value) => CharacterModel.fromJson(value)).toList();
    return response;
  }
}