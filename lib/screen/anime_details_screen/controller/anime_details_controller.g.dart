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
  Computed<bool>? _$staffLoadComputed;

  @override
  bool get staffLoad =>
      (_$staffLoadComputed ??= Computed<bool>(() => super.staffLoad,
              name: 'AnimeDetailsCnt.staffLoad'))
          .value;
  Computed<bool>? _$episodeLoadComputed;

  @override
  bool get episodeLoad =>
      (_$episodeLoadComputed ??= Computed<bool>(() => super.episodeLoad,
              name: 'AnimeDetailsCnt.episodeLoad'))
          .value;
  Computed<bool>? _$statsLoadComputed;

  @override
  bool get statsLoad =>
      (_$statsLoadComputed ??= Computed<bool>(() => super.statsLoad,
              name: 'AnimeDetailsCnt.statsLoad'))
          .value;
  Computed<bool>? _$reviewsLoadComputed;

  @override
  bool get reviewsLoad =>
      (_$reviewsLoadComputed ??= Computed<bool>(() => super.reviewsLoad,
              name: 'AnimeDetailsCnt.reviewsLoad'))
          .value;
  Computed<bool>? _$dataLoadedComputed;

  @override
  bool get dataLoaded =>
      (_$dataLoadedComputed ??= Computed<bool>(() => super.dataLoaded,
              name: 'AnimeDetailsCnt.dataLoaded'))
          .value;

  late final _$pagingAtom =
      Atom(name: 'AnimeDetailsCnt.paging', context: context);

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

  late final _$paginationAtom =
      Atom(name: 'AnimeDetailsCnt.pagination', context: context);

  @override
  EpisodePagination get pagination {
    _$paginationAtom.reportRead();
    return super.pagination;
  }

  @override
  set pagination(EpisodePagination value) {
    _$paginationAtom.reportWrite(value, super.pagination, () {
      super.pagination = value;
    });
  }

  late final _$stopLoadingAtom =
      Atom(name: 'AnimeDetailsCnt.stopLoading', context: context);

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

  late final _$staffLoadingAtom =
      Atom(name: 'AnimeDetailsCnt.staffLoading', context: context);

  @override
  bool get staffLoading {
    _$staffLoadingAtom.reportRead();
    return super.staffLoading;
  }

  @override
  set staffLoading(bool value) {
    _$staffLoadingAtom.reportWrite(value, super.staffLoading, () {
      super.staffLoading = value;
    });
  }

  late final _$episodeLoadingAtom =
      Atom(name: 'AnimeDetailsCnt.episodeLoading', context: context);

  @override
  bool get episodeLoading {
    _$episodeLoadingAtom.reportRead();
    return super.episodeLoading;
  }

  @override
  set episodeLoading(bool value) {
    _$episodeLoadingAtom.reportWrite(value, super.episodeLoading, () {
      super.episodeLoading = value;
    });
  }

  late final _$statsLoadingAtom =
      Atom(name: 'AnimeDetailsCnt.statsLoading', context: context);

  @override
  bool get statsLoading {
    _$statsLoadingAtom.reportRead();
    return super.statsLoading;
  }

  @override
  set statsLoading(bool value) {
    _$statsLoadingAtom.reportWrite(value, super.statsLoading, () {
      super.statsLoading = value;
    });
  }

  late final _$reviewLoadingAtom =
      Atom(name: 'AnimeDetailsCnt.reviewLoading', context: context);

  @override
  bool get reviewLoading {
    _$reviewLoadingAtom.reportRead();
    return super.reviewLoading;
  }

  @override
  set reviewLoading(bool value) {
    _$reviewLoadingAtom.reportWrite(value, super.reviewLoading, () {
      super.reviewLoading = value;
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

  late final _$staffErrorAtom =
      Atom(name: 'AnimeDetailsCnt.staffError', context: context);

  @override
  bool get staffError {
    _$staffErrorAtom.reportRead();
    return super.staffError;
  }

  @override
  set staffError(bool value) {
    _$staffErrorAtom.reportWrite(value, super.staffError, () {
      super.staffError = value;
    });
  }

  late final _$episodeErrorAtom =
      Atom(name: 'AnimeDetailsCnt.episodeError', context: context);

  @override
  bool get episodeError {
    _$episodeErrorAtom.reportRead();
    return super.episodeError;
  }

  @override
  set episodeError(bool value) {
    _$episodeErrorAtom.reportWrite(value, super.episodeError, () {
      super.episodeError = value;
    });
  }

  late final _$statsErrorAtom =
      Atom(name: 'AnimeDetailsCnt.statsError', context: context);

  @override
  bool get statsError {
    _$statsErrorAtom.reportRead();
    return super.statsError;
  }

  @override
  set statsError(bool value) {
    _$statsErrorAtom.reportWrite(value, super.statsError, () {
      super.statsError = value;
    });
  }

  late final _$reviewsErrorAtom =
      Atom(name: 'AnimeDetailsCnt.reviewsError', context: context);

  @override
  bool get reviewsError {
    _$reviewsErrorAtom.reportRead();
    return super.reviewsError;
  }

  @override
  set reviewsError(bool value) {
    _$reviewsErrorAtom.reportWrite(value, super.reviewsError, () {
      super.reviewsError = value;
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

  late final _$animeStaffModelAtom =
      Atom(name: 'AnimeDetailsCnt.animeStaffModel', context: context);

  @override
  AnimeStaffModel get animeStaffModel {
    _$animeStaffModelAtom.reportRead();
    return super.animeStaffModel;
  }

  @override
  set animeStaffModel(AnimeStaffModel value) {
    _$animeStaffModelAtom.reportWrite(value, super.animeStaffModel, () {
      super.animeStaffModel = value;
    });
  }

  late final _$animeEpisodesModelAtom =
      Atom(name: 'AnimeDetailsCnt.animeEpisodesModel', context: context);

  @override
  AnimeEpisodesModel get animeEpisodesModel {
    _$animeEpisodesModelAtom.reportRead();
    return super.animeEpisodesModel;
  }

  @override
  set animeEpisodesModel(AnimeEpisodesModel value) {
    _$animeEpisodesModelAtom.reportWrite(value, super.animeEpisodesModel, () {
      super.animeEpisodesModel = value;
    });
  }

  late final _$animeStatsModelAtom =
      Atom(name: 'AnimeDetailsCnt.animeStatsModel', context: context);

  @override
  AnimeStatsModel get animeStatsModel {
    _$animeStatsModelAtom.reportRead();
    return super.animeStatsModel;
  }

  @override
  set animeStatsModel(AnimeStatsModel value) {
    _$animeStatsModelAtom.reportWrite(value, super.animeStatsModel, () {
      super.animeStatsModel = value;
    });
  }

  late final _$animeReviewsModelAtom =
      Atom(name: 'AnimeDetailsCnt.animeReviewsModel', context: context);

  @override
  AnimeReviewsModel get animeReviewsModel {
    _$animeReviewsModelAtom.reportRead();
    return super.animeReviewsModel;
  }

  @override
  set animeReviewsModel(AnimeReviewsModel value) {
    _$animeReviewsModelAtom.reportWrite(value, super.animeReviewsModel, () {
      super.animeReviewsModel = value;
    });
  }

  late final _$getAnimeDetailsAsyncAction =
      AsyncAction('AnimeDetailsCnt.getAnimeDetails', context: context);

  @override
  Future<void> getAnimeDetails({required int animeId}) {
    return _$getAnimeDetailsAsyncAction
        .run(() => super.getAnimeDetails(animeId: animeId));
  }

  late final _$getAnimeStaffAsyncAction =
      AsyncAction('AnimeDetailsCnt.getAnimeStaff', context: context);

  @override
  Future<void> getAnimeStaff({required int animeId}) {
    return _$getAnimeStaffAsyncAction
        .run(() => super.getAnimeStaff(animeId: animeId));
  }

  late final _$getAnimeEpisodesAsyncAction =
      AsyncAction('AnimeDetailsCnt.getAnimeEpisodes', context: context);

  @override
  Future<void> getAnimeEpisodes({required int animeId}) {
    return _$getAnimeEpisodesAsyncAction
        .run(() => super.getAnimeEpisodes(animeId: animeId));
  }

  late final _$paginationOfEpisodeAsyncAction =
      AsyncAction('AnimeDetailsCnt.paginationOfEpisode', context: context);

  @override
  Future<void> paginationOfEpisode({required int animeId}) {
    return _$paginationOfEpisodeAsyncAction
        .run(() => super.paginationOfEpisode(animeId: animeId));
  }

  late final _$getAnimeStatsAsyncAction =
      AsyncAction('AnimeDetailsCnt.getAnimeStats', context: context);

  @override
  Future<void> getAnimeStats({required int animeId}) {
    return _$getAnimeStatsAsyncAction
        .run(() => super.getAnimeStats(animeId: animeId));
  }

  late final _$getAnimeReviewsAsyncAction =
      AsyncAction('AnimeDetailsCnt.getAnimeReviews', context: context);

  @override
  Future<void> getAnimeReviews({required int animeId}) {
    return _$getAnimeReviewsAsyncAction
        .run(() => super.getAnimeReviews(animeId: animeId));
  }

  late final _$paginationOfReviewsAsyncAction =
      AsyncAction('AnimeDetailsCnt.paginationOfReviews', context: context);

  @override
  Future<void> paginationOfReviews({required int animeId}) {
    return _$paginationOfReviewsAsyncAction
        .run(() => super.paginationOfReviews(animeId: animeId));
  }

  @override
  String toString() {
    return '''
paging: ${paging},
pagination: ${pagination},
stopLoading: ${stopLoading},
loading: ${loading},
staffLoading: ${staffLoading},
episodeLoading: ${episodeLoading},
statsLoading: ${statsLoading},
reviewLoading: ${reviewLoading},
isDataLoaded: ${isDataLoaded},
error: ${error},
staffError: ${staffError},
episodeError: ${episodeError},
statsError: ${statsError},
reviewsError: ${reviewsError},
errorMessage: ${errorMessage},
animeDetails: ${animeDetails},
animeStaffModel: ${animeStaffModel},
animeEpisodesModel: ${animeEpisodesModel},
animeStatsModel: ${animeStatsModel},
animeReviewsModel: ${animeReviewsModel},
load: ${load},
staffLoad: ${staffLoad},
episodeLoad: ${episodeLoad},
statsLoad: ${statsLoad},
reviewsLoad: ${reviewsLoad},
dataLoaded: ${dataLoaded}
    ''';
  }
}
