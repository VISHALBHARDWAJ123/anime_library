import 'package:mobx_examle/utils/app_export.dart';

abstract class ApiRepository {
  Future getAnimeInfo();
  Future<AnimeListModel> getAnimeList({required int currentPage, int? limit = 10});
  Future<CharacterData> getCharacterFullById({required int characterId});
  Future getCharacterAnime();
  Future getCharacterVoiceActors();
  Future<CharacterListModel> getCharactersList({required int currentPage, int? limit = 10});
  Future getUpcomingAnimeSeasons();
}
