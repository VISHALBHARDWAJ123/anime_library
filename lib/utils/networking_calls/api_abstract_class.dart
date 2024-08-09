import 'package:anime_library/utils/app_export.dart';
import 'package:anime_library/utils/models/anime_details_model.dart';

abstract class ApiRepository {
  Future<AnimeDetailsModel> getAnimeInfo({required int animeId});
  Future<AnimeListModel> getAnimeList({required int currentPage, int? limit = 10});
  Future<CharacterData> getCharacterFullById({required int characterId});
  Future getCharacterAnime();
  Future getCharacterVoiceActors();
  Future<CharacterListModel> getCharactersList({required int currentPage, int? limit = 10});
  Future getUpcomingAnimeSeasons();
  Future getRecommendedAnime();
  Future getRecommendedManga();
  Future getTopAnime();
  Future getTopManga();
  Future getTopCharacters();
}
