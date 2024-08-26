import 'package:anime_library/utils/app_export.dart';
import 'package:anime_library/utils/models/anime_details_model.dart';
import 'package:anime_library/utils/models/anime_episodes_model.dart';

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
  Future<AnimeStaffModel> getAnimeStaff({required int animeId});
  Future<AnimeEpisodesModel> getAnimeEpisodeList({required int animeId});
  Future getAnimeStats();
  Future getAnimeFeedbacks();
}
