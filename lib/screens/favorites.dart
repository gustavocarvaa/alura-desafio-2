import 'package:alura_desafio_2/controllers/hp_bloc.dart';
import 'package:flutter/material.dart';
import 'widgets/character_card.dart';

class Favorites extends StatelessWidget {
  final List<dynamic> favorites;

  Favorites({this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 80),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return CharacterCard(
                character: favorites[index],
                onTapTrailing: () => bloc.favCharacter(favorites[index]),
              );
            }),
      ),
    );
  }
}
