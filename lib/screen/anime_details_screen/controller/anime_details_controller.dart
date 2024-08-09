import 'package:anime_library/utils/app_export.dart';
import 'package:anime_library/utils/models/anime_details_model.dart';
import 'package:mobx/mobx.dart';

part 'anime_details_controller.g.dart';

class AnimeDetailsController = AnimeDetailsCnt with _$AnimeDetailsController;

abstract class AnimeDetailsCnt with Store {
  final apiController = ApiNetworkClass();

  @observable
  bool loading = true;
  @observable
  bool isDataLoaded = false;
  @observable
  bool error = false;
  @observable
  String errorMessage = 'Something went wrong!';
  @observable
  AnimeDetailsModel animeDetails = AnimeDetailsModel();

  @computed
  bool get load => loading;

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
}
