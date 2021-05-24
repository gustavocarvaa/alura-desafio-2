import 'package:alura_desafio_2/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel character;
  final List classMates;

  var itemBuilder;

  CharacterDetails({@required this.character, @required this.classMates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 200,
                  color: Colors.orange,
                  margin: EdgeInsets.all(16.0),
                  //TODO: Colocar loading na imagem
                  child: Image.network('${character.image}'),
                ),
                Container(
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Personagem: ${character.actor}'),
                      Text('Gênero: ${character.gender}'),
                      Text('Casa: ${character.house}'),
                      Text('Ancestry: ${character.ancestry}'),
                      Text('Patrono: ${character.patronus}'),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            ),
            Text('Colegas da mesma casa'),
            Container(
                margin: EdgeInsets.only(top: 16.0),
                height: 250,
                width: 300,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: classMates.length,
                    itemBuilder: (_, index) => ClipOval(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Image.network(classMates[index].image),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                        )))
          ],
        ),
      ),
    );
  }
}
