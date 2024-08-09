import 'package:anime_library/utils/app_export.dart';

class AmineListScreen extends StatefulWidget {
  const AmineListScreen({super.key});

  @override
  State<AmineListScreen> createState() => _AmineListScreenState();
}

class _AmineListScreenState extends State<AmineListScreen> {
  final controller = AnimeListController();

  final _scrollController = ScrollController();
  final double _boundaryOffset = 1.0;
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    controller.fetchInitialAnimeList(refresh: false);

    super.initState();
  }

  void _scrollListener() {
    if (!controller.stopLoading && _scrollController.position.pixels >= _scrollController.position.maxScrollExtent * _boundaryOffset && !controller.paging) {
      controller.paginationOfAnimeList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          key: _key,
          appBar: const SizedBox(),
          slider: const CustomNavigationDrawer(),
          child: CustomScrollView(
            controller: ScrollController(),
            slivers: [
              SliverAppBar(
                toolbarHeight: Adaptive.h(7),
                pinned: true,
                floating: false,
                leading: InkWell(
                  onTap: () => _key.currentState!.isDrawerOpen ? _key.currentState!.closeSlider() : _key.currentState!.openSlider(),
                  child: Image.asset(
                    'assets/mylogo.png',
                    height: Adaptive.h(7),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CustomMaterialIndicator(
                  onRefresh: () => controller.fetchInitialAnimeList(refresh: true),
                  indicatorBuilder: (context, controller) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: loadingBar(
                        width: Adaptive.w(25),
                        height: Adaptive.w(25),
                      ),
                    );
                  },
                  child: Observer(builder: (context) {
                    return controller.loading
                        ? Center(
                            child: loadingBar(
                              width: Adaptive.w(30),
                              height: Adaptive.h(30),
                            ),
                          )
                        : SizedBox(
                            height: Adaptive.h(100),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                GridView.builder(
                                  controller: _scrollController,
                                  itemCount: controller.animeList.length,
                                  itemBuilder: (_, index) => AnimeItemWidget(
                                    itemModel: controller.animeList[index],
                                  ),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1.2,
                                  ),
                                ),
                                if (controller.paging)
                                  const Align(
                                    alignment: Alignment.topCenter,
                                    child: SpinKitWave(
                                      color: Colors.purple,
                                      type: SpinKitWaveType.start,
                                    ),
                                  )
                              ],
                            ),
                          );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
