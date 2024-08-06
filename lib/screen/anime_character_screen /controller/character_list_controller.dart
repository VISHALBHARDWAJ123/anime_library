import 'dart:ffi';

import 'package:mobx/mobx.dart';
import 'package:mobx_examle/utils/app_export.dart';

part 'character_list_controller.g.dart';

class AnimeCharactersListController = AnimeCharacterListController with _$AnimeCharactersListController;

abstract class AnimeCharacterListController with Store {
  @observable
  CharacterListModel data = CharacterListModel();

  final _apiClassInstance = ApiNetworkClass();
  @observable
  Pagination paginationData = Pagination();
  @observable
  bool loading = false;
  @observable
  bool paging = false;
  @observable
  bool error = false;
  @observable
  String errorMessage = '';
  @observable
  bool stopLoading = false;
  @observable
  ObservableList<CharacterItemModel> characterList = ObservableList<CharacterItemModel>();
  @observable
  CharacterListModel initialCharacterModel = CharacterListModel();

  @action
  Future<void> getCharacters({bool? refresh = true, int? limit = 24}) async {
    loading = !refresh!;
    try {
      await _apiClassInstance.getCharactersList(currentPage: 1, limit: limit).then((data) {
        initialCharacterModel = data;
        characterList.clear();
        characterList.addAll(initialCharacterModel.data ?? []);
        if (kDebugMode) {
          print(characterList.length);
        }
        paginationData = initialCharacterModel.pagination ?? Pagination();
      });
    } catch (e, stack) {
      error = true;
      errorMessage = e.toString();
      loading = false;
    }
    loading = false;
  }

  @action
  Future<void> getNextCharacters({int? limit = 24}) async {
    paging = true;
    if (paginationData.hasNextPage!) {
      try {
        await _apiClassInstance.getCharactersList(currentPage: paginationData.currentPage! + 1, limit: limit).then((data) {
          initialCharacterModel = data;
          // characterList.clear();
          characterList.addAll(initialCharacterModel.data ?? []);
          if (kDebugMode) {
            print(characterList.length);
          }
          paginationData = initialCharacterModel.pagination ?? Pagination();
        });
      } catch (e, stack) {
        /// error
      }
    }
    paging = false;
  }

  @action
  Future<void> getSearchedCharacters({required String query, int? limit = 24}) async {}
}
