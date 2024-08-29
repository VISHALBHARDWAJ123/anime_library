import 'package:anime_library/utils/app_export.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = HomeScreenCnt with _$HomeScreenController;

abstract class HomeScreenCnt with Store {
  @action
  Future<List<AnimeListItemModel>> topAnimeSliderData() async {
    final value = await ApiNetworkClass().getTopAnime();
    return value.data!;
  }

  @action
  Future<List<AnimeListItemModel>> upcomingAnimeSeason() async {
    final value = await ApiNetworkClass().getUpcomingAnimeSeasons();
    return value.data!;
  }

  @action
  Future<List<AnimeListItemModel>> actionAnime() async {
    final value = await ApiNetworkClass().getUpcomingAnimeSeasons();
    return value.data!;
  }
}
