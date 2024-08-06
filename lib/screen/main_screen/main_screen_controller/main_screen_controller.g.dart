// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenController on MainScreenController, Store {
  late final _$paginationDataAtom =
      Atom(name: 'MainScreenController.paginationData', context: context);

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
      Atom(name: 'MainScreenController.loading', context: context);

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
      Atom(name: 'MainScreenController.paging', context: context);

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
      Atom(name: 'MainScreenController.error', context: context);

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
      Atom(name: 'MainScreenController.errorMessage', context: context);

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
      Atom(name: 'MainScreenController.stopLoading', context: context);

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

  late final _$animeListAtom =
      Atom(name: 'MainScreenController.animeList', context: context);

  @override
  ObservableList<AnimeListItemModel> get animeList {
    _$animeListAtom.reportRead();
    return super.animeList;
  }

  @override
  set animeList(ObservableList<AnimeListItemModel> value) {
    _$animeListAtom.reportWrite(value, super.animeList, () {
      super.animeList = value;
    });
  }

  late final _$initialAnimeListAtom =
      Atom(name: 'MainScreenController.initialAnimeList', context: context);

  @override
  AnimeListModel get initialAnimeList {
    _$initialAnimeListAtom.reportRead();
    return super.initialAnimeList;
  }

  @override
  set initialAnimeList(AnimeListModel value) {
    _$initialAnimeListAtom.reportWrite(value, super.initialAnimeList, () {
      super.initialAnimeList = value;
    });
  }

  late final _$fetchInitialAnimeListAsyncAction = AsyncAction(
      'MainScreenController.fetchInitialAnimeList',
      context: context);

  @override
  Future<void> fetchInitialAnimeList({bool? refresh = true, int? limit = 24}) {
    return _$fetchInitialAnimeListAsyncAction
        .run(() => super.fetchInitialAnimeList(refresh: refresh, limit: limit));
  }

  late final _$paginationOfAnimeListAsyncAction = AsyncAction(
      'MainScreenController.paginationOfAnimeList',
      context: context);

  @override
  Future<void> paginationOfAnimeList() {
    return _$paginationOfAnimeListAsyncAction
        .run(() => super.paginationOfAnimeList());
  }

  @override
  String toString() {
    return '''
paginationData: ${paginationData},
loading: ${loading},
paging: ${paging},
error: ${error},
errorMessage: ${errorMessage},
stopLoading: ${stopLoading},
animeList: ${animeList},
initialAnimeList: ${initialAnimeList}
    ''';
  }
}
