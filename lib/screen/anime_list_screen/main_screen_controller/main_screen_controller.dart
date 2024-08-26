import 'package:anime_library/utils/app_export.dart';
import 'package:mobx/mobx.dart';

part 'main_screen_controller.g.dart';

class AnimeListController = MainScreenController with _$AnimeListController;

abstract class MainScreenController with Store {
  final _apiClassInstance = ApiNetworkClass();
  @observable
  Pagination paginationData = Pagination();
  @observable
  bool loading = false;
  @observable
  bool paging = false;
  @observable
  bool error = false;
  @observable
  String errorMessage = '';
  @observable
  bool stopLoading = false;
  @observable
  ObservableList<AnimeListItemModel> animeList =
      ObservableList<AnimeListItemModel>();
  @observable
  AnimeListModel initialAnimeList = AnimeListModel();

  @action
  Future<void> fetchInitialAnimeList(
      {bool? refresh = true, int? limit = 24}) async {
    loading = !refresh!;
    try {
      await _apiClassInstance
          .getAnimeList(currentPage: 1, limit: limit)
          .then((data) {
        initialAnimeList = data;
        animeList.clear();
        animeList.addAll(initialAnimeList.data ?? []);
        if (kDebugMode) {
          print(animeList.length);
        }
        paginationData = initialAnimeList.pagination ?? Pagination();
      });
    } catch (e, stack) {
      error = true;
      errorMessage = e.toString();
      loading = false;
    }
    loading = false;
  }

  @action
  Future<void> paginationOfAnimeList() async {
    final tempLastPage = paginationData.currentPage ?? 1;
    final visibleLastPage = paginationData.lastVisiblePage ?? 1;
    paging = true;
    stopLoading = true;
    try {
      paginationData.hasNextPage!
          ? await _apiClassInstance
              .getAnimeList(currentPage: tempLastPage + 1, limit: 24)
              .then((data) {
              initialAnimeList = data;
              animeList.addAll(initialAnimeList.data ?? []);
              if (kDebugMode) {
                print(animeList.length);
              }
              paginationData = initialAnimeList.pagination ?? Pagination();
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
}
