import 'package:alura_desafio_2/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String TABLE_NAME = 'characters';

const String CHARACTERS_TABLE =
    'CREATE TABLE characters (id INTEGER PRIMARY KEY autoincrement, '
    'name TEXT, species TEXT, gender TEXT, house TEXT, dateOfBirth TEXT, '
    'yearOfBirth TEXT, ancestry TEXT, eyeColour TEXT, hairColour TEXT, '
    'patronus TEXT, hogwartsStudent INTEGER, hogwartsStaff INTEGER, actor TEXT, '
    'alive INTEGER, image TEXT, favorite INTEGER)';

Future<Database> createDataBase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'hpchallenge.db');
    return openDatabase(path, onCreate: (db, version) {
      //TODO: TABLE WAND NOT CREATED
      return db.execute(CHARACTERS_TABLE);
    }, version: 1);
  });
}

Future<int> save(CharacterModel characterModel) {
  return createDataBase().then((db) {
    final Map<String, dynamic> characterMap = Map();
    characterMap['id'] = characterModel.id;
    characterMap['name'] = characterModel.name;
    characterMap['species'] = characterModel.species;
    characterMap['gender'] = characterModel.gender;
    characterMap['house'] = characterModel.house;
    characterMap['dateOfBirth'] = characterModel.dateOfBirth;
    characterMap['yearOfBirth'] = characterModel.yearOfBirth;
    characterMap['ancestry'] = characterModel.ancestry;
    characterMap['eyeColour'] = characterModel.eyeColour;
    characterMap['hairColour'] = characterModel.hairColour;
    //TODO: add another table for wand 
    // if (characterModel.wand != null) {
    //   characterMap['wand'] = characterModel.wand.toJson();
    // }
    characterMap['patronus'] = characterModel.patronus;
    characterMap['hogwartsStudent'] = characterModel.hogwartsStudent;
    characterMap['hogwartsStaff'] = characterModel.hogwartsStaff;
    characterMap['actor'] = characterModel.actor;
    characterMap['alive'] = characterModel.alive;
    characterMap['image'] = characterModel.image;
    characterMap['favorite'] = characterModel.favorite;

    return db.insert(TABLE_NAME, characterMap);
  });
}

Future<List<CharacterModel>> findAll() async {
  try {
    final Database db = await createDataBase();
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

    return List.generate(
      maps.length,
      (i) {
        return CharacterModel.fromMap(maps[i]);
      },
    );
  } catch (ex) {
    print(ex);
    return [];
  }
}

Future<dynamic> updateFav(CharacterModel model) async {
  // int id = model.id;
  try {
    final Database db = await createDataBase();
    return await db.update(TABLE_NAME, model.toMap(),
        where: 'id = ?', whereArgs: [model.id]);
  } catch (e) {
    return null;
  }
}
