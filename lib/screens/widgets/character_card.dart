import 'package:alura_desafio_2/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;
  final Function() onTapTrailing;
  final Function() onTapCard;

  CharacterCard({@required this.character, this.onTapTrailing, this.onTapCard});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: onTapCard,
      contentPadding: EdgeInsets.all(12.0),
      title: Text(character?.actor ?? ''),
      subtitle: Text(character?.house ?? ''),
      trailing: GestureDetector(onTap: onTapTrailing, child: _isFav(character)),
      leading: ClipOval(
        child: Container(
          height: 50,
          width: 50,
          child: Image.network(character.image),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
      ),
    ));
  }

    Widget _isFav(CharacterModel model) {
    return Container(
        height: 50,
        width: 50,
        color: Colors.transparent,
        child: model.favorite == 1
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(Icons.favorite_outline));
  }
}
