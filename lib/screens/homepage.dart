import 'package:alura_desafio_2/controllers/hp_bloc.dart';
import 'package:alura_desafio_2/screens/character_details.dart';
import 'package:alura_desafio_2/screens/favorites.dart';
import 'package:flutter/material.dart';

import 'widgets/character_card.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> favorites;
    bloc.fetchAllWizards();

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: 200.0,
          title: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child:
                      Image.asset('assets/images/capa.jpg', fit: BoxFit.cover)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Text('Harry Potter Challenge')),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<List<dynamic>>(
              stream: bloc.allWizards,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  favorites = snapshot.data
                      .where((element) => element.favorite == 1)
                      .toList();

                  return ListView.builder(
                      padding: EdgeInsets.only(bottom: 80),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var classMates = snapshot.data
                      .where((element) => element.house == snapshot.data[index].house && element.id != snapshot.data[index].id)
                      .toList();
                        return CharacterCard(
                          character: snapshot.data[index],
                          onTapCard: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharacterDetails(
                                      character: snapshot.data[index], classMates: classMates
                                    )),
                          ),
                          onTapTrailing: () =>
                              bloc.favCharacter(snapshot.data[index]),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: favorites?.length == 0
              ? null
              : () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Favorites(favorites: favorites)),
                  ),
          child: Icon(Icons.favorite_outline),
        ));
  }
}
