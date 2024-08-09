import 'package:anime_library/utils/app_export.dart';

class CharacterDetailsScreens extends StatefulWidget {
  const CharacterDetailsScreens({super.key, required this.image, required this.characterId});

  final String image;
  final int characterId;

  @override
  State<CharacterDetailsScreens> createState() => _CharacterDetailsScreensState();
}

class _CharacterDetailsScreensState extends State<CharacterDetailsScreens> {
  final controller = CharacterDetailController();

  late Future<Color> _returnColor;

  @override
  void initState() {
    // TODO: implement initState
    controller.getCharacterDetails(characterId: widget.characterId);
    _returnColor = returnDominantColor(
      imageUrl: widget.image,
      callback: () async {
        await controller.getCharacterDetails(characterId: widget.characterId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        // backgroundColor: controller.backgroundColor,
        body: FutureBuilder<Color>(
            future: _returnColor,
            builder: (context, snapshot) => snapshot.hasData
                ? Container(
                    color: (snapshot.data ?? Colors.blue).withOpacity(.3),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: Adaptive.h(35),
                          child: Stack(
                            children: [
                              Container(
                                height: Adaptive.h(28),
                                width: Adaptive.w(100),
                                decoration: BoxDecoration(
                                  color: (snapshot.data ?? Colors.blue),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(.5, .5),
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.image,
                                    height: Adaptive.h(28),
                                    placeholder: (context, _) => Container(
                                      padding: const EdgeInsets.all(30.0),
                                      child: loadingBar(),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 10,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.arrow_back),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        if (controller.loading && controller.characterData.name != null)
                          Expanded(
                            child: SingleChildScrollView(
                              controller: ScrollController(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    verticalSpace(spaceValue: 5),
                                    HtmlWidget(
                                      '''<h2>${controller.characterData.name}</h2>''',
                                      buildAsync: true,
                                    ),
                                    HtmlWidget(
                                      controller.characterData.about ?? '',
                                      buildAsync: true,
                                    ),
                                    verticalSpace(spaceValue: 1),
                                    const HtmlWidget(
                                      '''<h2>Description</h2>''',
                                      buildAsync: true,
                                    ),
                                    verticalSpace(spaceValue: .5),
                                    ReadMoreText(
                                      controller.characterData.fullDetails ?? '',
                                      trimMode: TrimMode.Line,
                                      trimLines: 2,
                                      colorClickableText: Colors.blue,
                                      moreStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    verticalSpace(spaceValue: 1),
                                    const HtmlWidget(
                                      '''<h2>Voice Actor</h2>''',
                                      buildAsync: true,
                                    ),
                                    verticalSpace(spaceValue: .5),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: List.generate(
                                          controller.characterData.voices!.length,
                                          (index) => SizedBox(
                                            width: Adaptive.w(45),
                                            height: Adaptive.w(52),
                                            child: VoiceActorWidget(
                                              itemModel: controller.characterData.voices![index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpace(spaceValue: 1),
                                    const HtmlWidget(
                                      '''<h2>Anime Appearance</h2>''',
                                      buildAsync: true,
                                    ),
                                    verticalSpace(spaceValue: .5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: List.generate(
                                            controller.characterData.anime!.length,
                                            (index) => SizedBox(
                                              width: Adaptive.w(45),
                                              height: Adaptive.w(52),
                                              child: AnimeAppearanceWidget(
                                                itemModel: controller.characterData.anime![index],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpace(spaceValue: 1),
                                    const HtmlWidget(
                                      '''<h2>Manga Appearance</h2>''',
                                      buildAsync: true,
                                    ),
                                    verticalSpace(spaceValue: .5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: List.generate(
                                            controller.characterData.manga!.length,
                                            (index) => SizedBox(
                                              width: Adaptive.w(45),
                                              height: Adaptive.w(52),
                                              child: AnimeAppearanceWidget(
                                                itemModel: AnimeElement(role: controller.characterData.manga![index].role, anime: controller.characterData.manga![index].manga),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (!controller.loading)
                          Center(
                            child: loadingBar(),
                          )
                      ],
                    ),
                  )
                : Center(
                    child: loadingBar(),
                  )),
      );
    });
  }

  void setTitleBarColor() async {
    final color = await returnDominantColor(
      imageUrl: '',
      callback: () {},
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color.withOpacity(.7), // Status bar color
    ));
  }
}
