import 'package:anime_library/utils/app_export.dart';

import 'package:mobx/mobx.dart';

part 'anime_details_controller.g.dart';

class AnimeDetailsController = AnimeDetailsCnt with _$AnimeDetailsController;

abstract class AnimeDetailsCnt with Store {
  final apiController = ApiNetworkClass();
  int _page = 1;
  @observable
  bool paging = false;
  @observable
  EpisodePagination pagination = EpisodePagination();
  @observable
  bool stopLoading = false;
  @observable
  bool loading = true;
  @observable
  bool staffLoading = true;
  @observable
  bool episodeLoading = true;
  @observable
  bool statsLoading = true;
  @observable
  bool reviewLoading = true;
  @observable
  bool isDataLoaded = false;
  @observable
  bool error = false;
  @observable
  bool staffError = false;
  @observable
  bool episodeError = false;
  @observable
  bool statsError = false;
  @observable
  bool reviewsError = false;
  @observable
  String errorMessage = 'Something went wrong!';
  @observable
  AnimeDetailsModel animeDetails = AnimeDetailsModel();
  @observable
  AnimeStaffModel animeStaffModel = AnimeStaffModel();
  @observable
  AnimeEpisodesModel animeEpisodesModel = AnimeEpisodesModel();
  @observable
  AnimeStatsModel animeStatsModel = AnimeStatsModel();
  @observable
  AnimeReviewsModel animeReviewsModel = AnimeReviewsModel();

  @computed
  bool get load => loading;

  @computed
  bool get staffLoad => staffLoading;

  @computed
  bool get episodeLoad => episodeLoading;

  @computed
  bool get statsLoad => statsLoading;

  @computed
  bool get reviewsLoad => reviewLoading;

  @computed
  bool get dataLoaded => isDataLoaded;

  @action
  Future<void> getAnimeDetails({required int animeId}) async {
    loading = false;
    try {
      await apiController.getAnimeInfo(animeId: animeId).then((value) {
        animeDetails = value;
        isDataLoaded = true;
      });
    } catch (e) {
      error = true;
    }
    loading = true;
  }

  @action
  Future<void> getAnimeStaff({required int animeId}) async {
    staffLoading = true;
    try {
      final data = animeStaffModel.data != null ? animeStaffModel : await apiController.getAnimeStaff(animeId: animeId);
      animeStaffModel = data;
    } catch (e) {
      staffError = true;
    }
    staffLoading = false;
  }

  @action
  Future<void> getAnimeEpisodes({required int animeId}) async {
    episodeLoading = true;
    try {
      final data = animeEpisodesModel.data != null ? animeEpisodesModel : await apiController.getAnimeEpisodeList(animeId: animeId);
      animeEpisodesModel = data;
    } catch (e) {
      episodeError = true;
    }
    episodeLoading = false;
  }

  @action
  Future<void> paginationOfEpisode({required int animeId}) async {
    if (animeEpisodesModel.pagination!.hasNextPage!) {
      _page = _page + 1;
    }
    paging = true;
    stopLoading = true;
    try {
      animeEpisodesModel.pagination!.hasNextPage!
          ? await apiController.getAnimeEpisodeList(animeId: animeId, page: _page).then((data) {
              animeEpisodesModel.data!.addAll(data.data ?? []);

              animeEpisodesModel.pagination = data.pagination ?? EpisodePagination();
            })
          : null;
    } catch (e, stack) {
      /*    error = true;
      errorMessage = e.toString();*/
      paging = false;
    }
    paging = false;
    stopLoading = false;
  }

  @action
  Future<void> getAnimeStats({required int animeId}) async {
    statsLoading = true;
    try {
      final data = animeStatsModel.data != null ? animeStatsModel : await apiController.getAnimeStats(animeId: animeId);
      animeStatsModel = data;
    } catch (e) {
      statsError = true;
    }
    statsLoading = false;
  }

  @action
  Future<void> getAnimeReviews({required int animeId}) async {
    reviewLoading = true;
    try {
      final data = animeReviewsModel.data != null ? animeReviewsModel : await apiController.getAnimeFeedbacks(animeId: animeId);
      animeReviewsModel = data;
    } catch (e) {
      reviewsError = true;
    }
    reviewLoading = false;
  }

  @action
  Future<void> paginationOfReviews({required int animeId}) async {
    print(animeReviewsModel.pagination!.hasNextPage!);
    if (animeReviewsModel.pagination!.hasNextPage!) {
      _page = _page + 1;
    }
    paging = true;
    stopLoading = true;
    try {
      animeReviewsModel.pagination!.hasNextPage!
          ? await apiController.getAnimeFeedbacks(animeId: animeId, page: _page).then((data) {
              animeReviewsModel.data!.addAll(data.data ?? []);

              animeReviewsModel.pagination = data.pagination ?? EpisodePagination();
            })
          : null;
    } catch (e, stack) {
      paging = false;
    }
    paging = false;
    stopLoading = false;
  }
}
