// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnimeDetailsController on AnimeDetailsCnt, Store {
  Computed<bool>? _$loadComputed;

  @override
  bool get load => (_$loadComputed ??=
          Computed<bool>(() => super.load, name: 'AnimeDetailsCnt.load'))
      .value;
  Computed<bool>? _$dataLoadedComputed;

  @override
  bool get dataLoaded =>
      (_$dataLoadedComputed ??= Computed<bool>(() => super.dataLoaded,
              name: 'AnimeDetailsCnt.dataLoaded'))
          .value;

  late final _$loadingAtom =
      Atom(name: 'AnimeDetailsCnt.loading', context: context);

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

  late final _$isDataLoadedAtom =
      Atom(name: 'AnimeDetailsCnt.isDataLoaded', context: context);

  @override
  bool get isDataLoaded {
    _$isDataLoadedAtom.reportRead();
    return super.isDataLoaded;
  }

  @override
  set isDataLoaded(bool value) {
    _$isDataLoadedAtom.reportWrite(value, super.isDataLoaded, () {
      super.isDataLoaded = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'AnimeDetailsCnt.error', context: context);

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
      Atom(name: 'AnimeDetailsCnt.errorMessage', context: context);

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

  late final _$animeDetailsAtom =
      Atom(name: 'AnimeDetailsCnt.animeDetails', context: context);

  @override
  AnimeDetailsModel get animeDetails {
    _$animeDetailsAtom.reportRead();
    return super.animeDetails;
  }

  @override
  set animeDetails(AnimeDetailsModel value) {
    _$animeDetailsAtom.reportWrite(value, super.animeDetails, () {
      super.animeDetails = value;
    });
  }

  late final _$getAnimeDetailsAsyncAction =
      AsyncAction('AnimeDetailsCnt.getAnimeDetails', context: context);

  @override
  Future<void> getAnimeDetails({required int animeId}) {
    return _$getAnimeDetailsAsyncAction
        .run(() => super.getAnimeDetails(animeId: animeId));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isDataLoaded: ${isDataLoaded},
error: ${error},
errorMessage: ${errorMessage},
animeDetails: ${animeDetails},
load: ${load},
dataLoaded: ${dataLoaded}
    ''';
  }
}
