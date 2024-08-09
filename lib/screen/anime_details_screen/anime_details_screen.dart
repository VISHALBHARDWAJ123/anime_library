import 'package:anime_library/screen/anime_details_screen/controller/anime_details_controller.dart';
import 'package:anime_library/utils/app_export.dart';
import 'package:anime_library/utils/models/anime_details_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AnimeDetailsScreen extends StatefulWidget {
  const AnimeDetailsScreen({super.key, required this.image, required this.animeId});

  final String image;
  final int animeId;

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  final controller = AnimeDetailsController();
  late Future<Color> dominentColor;

  @override
  void initState() {
    // TODO: implement initState
    controller.getAnimeDetails(animeId: widget.animeId);
    dominentColor = returnDominantColor(
        imageUrl: widget.image,
        callback: () async {
          await controller.getAnimeDetails(animeId: widget.animeId);
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
          warnWhenNoObservables: true,
          builder: (context) {
            bool loading = controller.loading;
            bool dataLoaded = controller.isDataLoaded;
            return FutureBuilder<Color>(
                future: dominentColor,
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
                            if (loading && dataLoaded)
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
                                          '''<h1>${controller.animeDetails.data!.title}</h1>''',
                                          buildAsync: false,
                                        ),
                                        HtmlWidget(
                                          '''<h2>${controller.animeDetails.data!.titleJapanese}</h2>''',
                                          buildAsync: false,
                                        ),
                                        verticalSpace(spaceValue: 3),
                                        const HtmlWidget(
                                          '''<h3>Synopsis</h3>''',
                                          buildAsync: false,
                                        ),
                                        verticalSpace(spaceValue: .5),
                                        ReadMoreText(
                                          controller.animeDetails.data!.synopsis ?? '',
                                          trimMode: TrimMode.Line,
                                          trimLines: 5,
                                          colorClickableText: Colors.blue,
                                          moreStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 3),
                                        const HtmlWidget(
                                          '''<h3>Background</h3>''',
                                          buildAsync: false,
                                        ),
                                        verticalSpace(spaceValue: .5),
                                        ReadMoreText(
                                          controller.animeDetails.data!.background ?? '',
                                          trimMode: TrimMode.Line,
                                          trimLines: 5,
                                          colorClickableText: Colors.blue,
                                          moreStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        const HtmlWidget(
                                          '''<h2>Information</h2>''',
                                          buildAsync: false,
                                        ),
                                        verticalSpace(spaceValue: .5),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Type: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.animeDetails.data!.type!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Episodes: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '${controller.animeDetails.data!.episodes!}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Status: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.animeDetails.data!.status!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Aired: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.animeDetails.data!.aired!.string!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Broadcast: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.animeDetails.data!.broadcast!.string!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Producers: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: getProducers(controller.animeDetails.data!.producers!),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Licensors: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: getProducers(controller.animeDetails.data!.licensors!),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Studios: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: getProducers(controller.animeDetails.data!.studios!),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Source: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.animeDetails.data!.source!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Genres: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: getProducers(controller.animeDetails.data!.genres!),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Theme: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: getProducers(controller.animeDetails.data!.themes!),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Demographic: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: getProducers(controller.animeDetails.data!.demographics!),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Duration: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.animeDetails.data!.duration!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Rating: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: controller.animeDetails.data!.rating!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        verticalSpace(spaceValue: 2),
                                        const HtmlWidget(
                                          '''<h2>Available At</h2>''',
                                          buildAsync: false,
                                        ),
                                        verticalSpace(spaceValue: 1),
                                        if (controller.animeDetails.data!.dataExternal != null && controller.animeDetails.data!.dataExternal!.isNotEmpty)
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.link,
                                                color: '#acc4ec'.toColor().withRed(122),
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              AutoSizeText(
                                                controller.animeDetails.data!.dataExternal![0].name!,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: '#acc4ec'.toColor().withRed(122),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (controller.animeDetails.data!.dataExternal != null && controller.animeDetails.data!.dataExternal!.isNotEmpty)
                                          returnResourcesWidget(controller.animeDetails.data!.dataExternal ?? [])
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
                      ));
          }),
    );
  }

  Widget returnResourcesWidget(List<External> list) {
    if (list.length > 1) {
      return Column(
        children: [
          verticalSpace(spaceValue: 2),
          const HtmlWidget(
            '''<h2>Resources</h2>''',
            buildAsync: false,
          ),
          verticalSpace(spaceValue: 1),
          Row(
            children: List.generate(
              list.length,
              (index) => index == list.length - 1
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: AutoSizeText(
                        controller.animeDetails.data!.dataExternal![index + 1].name!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
            ),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  /// /*Side Stories and Prequels and other details*/
  Widget returnSideStories({
    required List<Relation> list,
  }) {
    if (list.isEmpty) {
      return const SizedBox();
    } else {
      return Column(
        children: List.generate(
          list.length,
          (index) {
            return SizedBox();
          },
        ),
      );
    }
  }

  String getProducers(List<Demographic> list) {
    List<String> producers = [];

    for (Demographic element in list) {
      producers.add(element.name!);
    }
    return producers.join(', ');
  }
}
