import 'package:mobx_examle/utils/app_export.dart';

class AnimeCharactersScreen extends StatefulWidget {
  const AnimeCharactersScreen({super.key});

  @override
  State<AnimeCharactersScreen> createState() => _AnimeCharactersScreenState();
}

class _AnimeCharactersScreenState extends State<AnimeCharactersScreen> {
  final controller = AnimeCharactersListController();
  final _scrollController = ScrollController();

  final double _boundaryOffset = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    controller.getCharacters(refresh: false);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (!controller.stopLoading && _scrollController.position.pixels >= _scrollController.position.maxScrollExtent * _boundaryOffset && !controller.paging) {
      controller.getNextCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        controller: ScrollController(),
        slivers: [
          SliverAppBar(
            toolbarHeight: Adaptive.h(7),
            pinned: true,
            floating: false,
            leading: Image.asset(
              'assets/mylogo.png',
              height: Adaptive.h(7),
            ),
            title: const AutoSizeText('Characters Screen'),
          ),
          SliverToBoxAdapter(
            child: CustomMaterialIndicator(
              onRefresh: () => controller.getCharacters(refresh: true),
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
                        height: Adaptive.h(100) - 90,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            GridView.builder(
                              controller: _scrollController,
                              itemCount: controller.characterList.length,
                              itemBuilder: (_, index) => InkWell(
                                onTap: () {
                                  goToScreen(
                                    routeName: animeCharacterDetailsPageRoute,
                                    context: context,
                                    data: '?image=${controller.characterList[index].images!.jpg!.imageUrl}&characterId=${controller.characterList[index].malId}',
                                  );
                                },
                                child: AnimeCharacterItemWidget(
                                  itemModel: controller.characterList[index],
                                ),
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
    ));
  }
}
