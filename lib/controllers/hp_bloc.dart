import 'package:alura_desafio_2/database/app_database.dart';
import 'package:alura_desafio_2/models/character_model.dart';
import 'package:alura_desafio_2/repositories/hp_repository.dart';
import 'package:rxdart/rxdart.dart';

class WizardsBloc {
  final _repository = CharacterRepo();
  final _wizardFetcher = PublishSubject<List<dynamic>>();

  Stream<List<dynamic>> get allWizards => _wizardFetcher.stream;

  fetchAllWizards() async {
    List itemModel;
    findAll().then((value) async {
      if (value.isEmpty) {
        itemModel = await _repository.getWizards();
        itemModel.forEach((element) async {
          await save(element);
          _wizardFetcher.sink.add(itemModel);
        });
      } else {
        _wizardFetcher.sink.add(value);
      }
    });
  }

  favCharacter(CharacterModel model) async {
    model.favorite = model.favorite == 1 ? 0 : 1;
    
    await updateFav(model);

    //atualizando lista
    fetchAllWizards();
  }

  dispose() {
    _wizardFetcher.close();
  }
}

final bloc = WizardsBloc();
