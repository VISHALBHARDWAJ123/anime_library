import 'package:anime_library/utils/app_export.dart';

class ApiNetworkClass extends ApiRepository {
  @override
  Future<CharacterListModel> getCharactersList({required int currentPage, int? limit = 10, String? query = ''}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '${CHARACTER_LIST_ENDPOINT}page=$currentPage&limit=$limit&q=$query');
      return CharacterListModel.fromJson(data);
    } catch (e, stack) {
      print(e.toString());
      return CharacterListModel();
    }
  }

  @override
  Future<AnimeListModel> getAnimeList({required int currentPage, int? limit = 10}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$ANIME_LIST_ENDPOINT?page=$currentPage&limit=$limit');
      return AnimeListModel.fromJson(data);
    } catch (e, stack) {
      print(e.toString());
      return AnimeListModel();
    }
  }

  @override
  Future<CharacterData> getCharacterFullById({required int characterId}) async {
    // TODO: implement getCharacterFullById
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$CHARACTER_DETAIL_ENDPOINT$characterId/full');
      return CharacterDetailsModel.fromJson(data).data!;
    } catch (e, stack) {
      print(e.toString());
      return CharacterData();
    }
  }

  @override
  Future<AnimeDetailsModel> getAnimeInfo({required int animeId}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$ANIME_LIST_ENDPOINT/$animeId/full');

      return AnimeDetailsModel.fromJson(data);
    } catch (e, stack) {
      return AnimeDetailsModel();
    }
  }

  @override
  Future getRecommendedAnime() {
    // TODO: implement getRecommendedAnime
    throw UnimplementedError();
  }

  @override
  Future getRecommendedManga() {
    // TODO: implement getRecommendedManga
    throw UnimplementedError();
  }

  @override
  Future<AnimeListModel> getTopAnime() async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: TOP_ANIME_LIST_ENDPOINT);
      return AnimeListModel.fromJson(data);
    } catch (e, stack) {
      print(e.toString());
      return AnimeListModel();
    }
  }

  @override
  Future getTopCharacters() {
    // TODO: implement getTopCharacters
    throw UnimplementedError();
  }

  @override
  Future getTopManga() {
    // TODO: implement getTopManga
    throw UnimplementedError();
  }

  @override
  Future getCharacterAnime() {
    // TODO: implement getCharacterAnime
    throw UnimplementedError();
  }

  @override
  Future getCharacterVoiceActors() {
    // TODO: implement getCharacterVoiceActors
    throw UnimplementedError();
  }

  @override
  Future<AnimeEpisodesModel> getAnimeEpisodeList({required int animeId, int? page = 1}) async {
    // TODO: implement getAnimeEpisodeList
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$ANIME_LIST_ENDPOINT/$animeId/episodes?page=$page');
      return AnimeEpisodesModel.fromJson(data);
    } catch (e) {
      return AnimeEpisodesModel();
    }
  }

  @override
  Future<AnimeStaffModel> getAnimeStaff({required int animeId}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$ANIME_LIST_ENDPOINT/$animeId/staff');
      print(data.toString());
      return AnimeStaffModel.fromJson(data);
    } catch (e, stk) {
      return AnimeStaffModel();
    }
  }

  @override
  Future<AnimeReviewsModel> getAnimeFeedbacks({required int animeId, int? page = 1}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$ANIME_LIST_ENDPOINT/$animeId/reviews?page=$page');
      return AnimeReviewsModel.fromJson(data);
    } catch (e) {
      return AnimeReviewsModel();
    }
  }

  @override
  Future<AnimeStatsModel> getAnimeStats({required int animeId}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$ANIME_LIST_ENDPOINT/$animeId/statistics');
      print(data.toString());
      return AnimeStatsModel.fromJson(data);
    } catch (e, stk) {
      return AnimeStatsModel();
    }
  }

  @override
  Future<AnimeListModel> getUpcomingAnimeSeasons({int? page = 1, int? limit = 6}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '$UPCOMING_ANIME_SEASONS$limit&page=$page');
      return AnimeListModel.fromJson(data);
    } catch (e, stack) {
      print(e.toString());
      return AnimeListModel();
    }
  }
}
