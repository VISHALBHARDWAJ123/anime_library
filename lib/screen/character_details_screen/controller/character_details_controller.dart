import 'package:mobx/mobx.dart';
import 'package:anime_library/utils/app_export.dart';

part 'character_details_controller.g.dart';

class CharacterDetailController = CharacterDetailsController
    with _$CharacterDetailController;

abstract class CharacterDetailsController with Store {
  final _apiHelper = ApiNetworkClass();
  @observable
  bool loading = false;
  @observable
  bool error = false;
  @observable
  String errorMessage = '';
  @observable
  CharacterData characterData = CharacterData();
  @observable
  Color backgroundColor = Colors.white;

  @action
  Future<void> getCharacterDetails({required int characterId}) async {
    loading = true;
    try {
      await _apiHelper
          .getCharacterFullById(characterId: characterId)
          .then((value) => characterData = value);
      print(characterData.name);
    } catch (e) {
      error = true;
      errorMessage = e.toString();
    }
  }
}
