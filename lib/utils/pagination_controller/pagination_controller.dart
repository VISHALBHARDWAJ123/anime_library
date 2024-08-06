import 'package:mobx_examle/utils/app_export.dart';

class PaginationScrollController {
  late ScrollController scrollController;
  bool isLoading = true;
  bool stopLoading = false;
  int currentPage = 1;
  double boundaryOffset = -1;
  late Future loadAction;

  void init({Function? initAction, required Future loadAction}) {
    if (initAction != null) {
      initAction();
    }
    this.loadAction = loadAction;
    scrollController = ScrollController()..addListener(scrollListener);
  }

  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
  }

  void scrollListener() async {
    if (!stopLoading) {
      // Check if we've scrolled to the desired offset and are not already loading
      if (scrollController.offset >= scrollController.position.maxScrollExtent * boundaryOffset - 10 && !isLoading) {
        isLoading = true; // Set loading state

        // Use async/await to handle the loadAction future
        await loadAction.then((shouldStop) {
          isLoading = false; // Reset loading state
          currentPage++;
          boundaryOffset = 1 - 1 / (currentPage * 2);

          // If loadAction signals to stop loading, update the stopLoading flag
          if (shouldStop == true) {
            stopLoading = true;
          }
        }).catchError((error) {
          // Handle any errors that might occur during loadAction
          isLoading = false; // Reset loading state in case of an error
          print("Error loading data: $error");
        });
      }
    }
  }
}
