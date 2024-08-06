// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnimeCharactersListController on AnimeCharacterListController, Store {
  late final _$dataAtom =
      Atom(name: 'AnimeCharacterListController.data', context: context);

  @override
  CharacterListModel get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(CharacterListModel value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$paginationDataAtom = Atom(
      name: 'AnimeCharacterListController.paginationData', context: context);

  @override
  Pagination get paginationData {
    _$paginationDataAtom.reportRead();
    return super.paginationData;
  }

  @override
  set paginationData(Pagination value) {
    _$paginationDataAtom.reportWrite(value, super.paginationData, () {
      super.paginationData = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'AnimeCharacterListController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$pagingAtom =
      Atom(name: 'AnimeCharacterListController.paging', context: context);

  @override
  bool get paging {
    _$pagingAtom.reportRead();
    return super.paging;
  }

  @override
  set paging(bool value) {
    _$pagingAtom.reportWrite(value, super.paging, () {
      super.paging = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'AnimeCharacterListController.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'AnimeCharacterListController.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$stopLoadingAtom =
      Atom(name: 'AnimeCharacterListController.stopLoading', context: context);

  @override
  bool get stopLoading {
    _$stopLoadingAtom.reportRead();
    return super.stopLoading;
  }

  @override
  set stopLoading(bool value) {
    _$stopLoadingAtom.reportWrite(value, super.stopLoading, () {
      super.stopLoading = value;
    });
  }

  late final _$characterListAtom = Atom(
      name: 'AnimeCharacterListController.characterList', context: context);

  @override
  ObservableList<CharacterItemModel> get characterList {
    _$characterListAtom.reportRead();
    return super.characterList;
  }

  @override
  set characterList(ObservableList<CharacterItemModel> value) {
    _$characterListAtom.reportWrite(value, super.characterList, () {
      super.characterList = value;
    });
  }

  late final _$initialCharacterModelAtom = Atom(
      name: 'AnimeCharacterListController.initialCharacterModel',
      context: context);

  @override
  CharacterListModel get initialCharacterModel {
    _$initialCharacterModelAtom.reportRead();
    return super.initialCharacterModel;
  }

  @override
  set initialCharacterModel(CharacterListModel value) {
    _$initialCharacterModelAtom.reportWrite(value, super.initialCharacterModel,
        () {
      super.initialCharacterModel = value;
    });
  }

  late final _$getCharactersAsyncAction = AsyncAction(
      'AnimeCharacterListController.getCharacters',
      context: context);

  @override
  Future<void> getCharacters({bool? refresh = true, int? limit = 24}) {
    return _$getCharactersAsyncAction
        .run(() => super.getCharacters(refresh: refresh, limit: limit));
  }

  late final _$getNextCharactersAsyncAction = AsyncAction(
      'AnimeCharacterListController.getNextCharacters',
      context: context);

  @override
  Future<void> getNextCharacters({int? limit = 24}) {
    return _$getNextCharactersAsyncAction
        .run(() => super.getNextCharacters(limit: limit));
  }

  late final _$getSearchedCharactersAsyncAction = AsyncAction(
      'AnimeCharacterListController.getSearchedCharacters',
      context: context);

  @override
  Future<void> getSearchedCharacters({required String query, int? limit = 24}) {
    return _$getSearchedCharactersAsyncAction
        .run(() => super.getSearchedCharacters(query: query, limit: limit));
  }

  @override
  String toString() {
    return '''
data: ${data},
paginationData: ${paginationData},
loading: ${loading},
paging: ${paging},
error: ${error},
errorMessage: ${errorMessage},
stopLoading: ${stopLoading},
characterList: ${characterList},
initialCharacterModel: ${initialCharacterModel}
    ''';
  }
}
