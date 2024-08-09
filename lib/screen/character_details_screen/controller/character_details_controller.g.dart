// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailController on CharacterDetailsController, Store {
  late final _$loadingAtom =
      Atom(name: 'CharacterDetailsController.loading', context: context);

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

  late final _$errorAtom =
      Atom(name: 'CharacterDetailsController.error', context: context);

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
      Atom(name: 'CharacterDetailsController.errorMessage', context: context);

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

  late final _$characterDataAtom =
      Atom(name: 'CharacterDetailsController.characterData', context: context);

  @override
  CharacterData get characterData {
    _$characterDataAtom.reportRead();
    return super.characterData;
  }

  @override
  set characterData(CharacterData value) {
    _$characterDataAtom.reportWrite(value, super.characterData, () {
      super.characterData = value;
    });
  }

  late final _$backgroundColorAtom = Atom(
      name: 'CharacterDetailsController.backgroundColor', context: context);

  @override
  Color get backgroundColor {
    _$backgroundColorAtom.reportRead();
    return super.backgroundColor;
  }

  @override
  set backgroundColor(Color value) {
    _$backgroundColorAtom.reportWrite(value, super.backgroundColor, () {
      super.backgroundColor = value;
    });
  }

  late final _$getCharacterDetailsAsyncAction = AsyncAction(
      'CharacterDetailsController.getCharacterDetails',
      context: context);

  @override
  Future<void> getCharacterDetails({required int characterId}) {
    return _$getCharacterDetailsAsyncAction
        .run(() => super.getCharacterDetails(characterId: characterId));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
errorMessage: ${errorMessage},
characterData: ${characterData},
backgroundColor: ${backgroundColor}
    ''';
  }
}
