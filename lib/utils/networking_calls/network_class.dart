import 'package:anime_library/utils/app_export.dart';
import 'package:anime_library/utils/models/anime_episodes_model.dart';

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
  Future getTopAnime() {
    // TODO: implement getTopAnime
    throw UnimplementedError();
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
  Future getUpcomingAnimeSeasons() {
    // TODO: implement getUpcomingAnimeSeasons
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
  Future getAnimeFeedbacks() {
    // TODO: implement getAnimeFeedbacks
    throw UnimplementedError();
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
  Future getAnimeStats() {
    // TODO: implement getAnimeStats
    throw UnimplementedError();
  }
}
