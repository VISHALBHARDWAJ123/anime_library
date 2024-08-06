import 'package:mobx_examle/utils/app_export.dart';
import 'package:mobx_examle/utils/constants.dart';

class ApiNetworkClass extends ApiRepository {
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
  Future getAnimeInfo() {
    // TODO: implement getAnimeInfo
    throw UnimplementedError();
  }

  @override
  Future<CharacterListModel> getCharactersList({required int currentPage, int? limit = 10}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '${CHARACTER_LIST_ENDPOINT}page=$currentPage&limit=$limit');
      return CharacterListModel.fromJson(data);
    } catch (e, stack) {
      print(e.toString());
      return CharacterListModel();
    }
  }

  @override
  Future<AnimeListModel> getAnimeList({required int currentPage, int? limit = 10}) async {
    try {
      final data = await HttpRequest.getRequest(endpointWithValues: '${ANIME_LIST_ENDPOINT}page=$currentPage&limit=$limit');
      return AnimeListModel.fromJson(data);
    } catch (e, stack) {
      print(e.toString());
      return AnimeListModel();
    }
  }

  @override
  Future getUpcomingAnimeSeasons() {
    // TODO: implement getUpcomingAnimeSeasons
    throw UnimplementedError();
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
}
