import 'dart:convert';

import 'package:alura_desafio_2/models/character_model.dart';
import 'package:flutter/material.dart';

import 'screens/homepage.dart';

import 'database/app_database.dart';

import 'repositories/hp_repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HP Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
