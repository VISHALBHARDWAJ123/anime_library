import 'package:anime_library/screen/anime_details_screen/widget/custom_chart.dart';
import 'package:anime_library/utils/app_export.dart';

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
  int _activeIndex = 0;

  final _scrollController = ScrollController();
  final _reviewScrollController = ScrollController();

  void _scrollListener() {
    if (!controller.episodeLoading && _scrollController.position.pixels >= _scrollController.position.maxScrollExtent * _boundaryOffset && !controller.paging) {
      controller.paginationOfEpisode(animeId: controller.animeDetails.data!.malId!).whenComplete(() => setState(() {
            _activeIndex = 0;
            _activeIndex = 2;
          }));
      setState(() {
        _activeIndex = 0;
        _activeIndex = 2;
      });
    }
  }

  void _reviewScrollListener() {
    if (!controller.reviewLoading && _reviewScrollController.position.pixels >= _reviewScrollController.position.maxScrollExtent * _boundaryOffset && !controller.paging) {
      controller.paginationOfReviews(animeId: controller.animeDetails.data!.malId!).whenComplete(() => setState(() {
            _activeIndex = 0;
            _activeIndex = 4;
          }));
      setState(() {
        _activeIndex = 0;
        _activeIndex = 4;
      });
    }
  }

  final double _boundaryOffset = 1.0;

  Widget _staffItems() => Observer(builder: (context) {
        return controller.staffLoading
            ? Center(
                child: loadingBar(),
              )
            : controller.staffError
                ? const Center(
                    child: Text('Something went wrong'),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemCount: controller.animeStaffModel.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StaffViewWidget(
                        itemModel: controller.animeStaffModel.data![index],
                      );
                    },
                  );
      });

  Widget _episodeItems() => Observer(builder: (context) {
        return controller.episodeLoad
            ? Center(
                child: loadingBar(),
              )
            : controller.episodeError
                ? const Center(
                    child: Text('Something went wrong'),
                  )
                : _episodeItemsLength() == 0
                    ? const Center(
                        child: AutoSizeText('No Episodes Available. May be it is a Movie.'),
                      )
                    : FutureBuilder(
                        builder: (context, snap) {
                          return Stack(
                            children: [
                              Scrollbar(
                                controller: _scrollController,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: _episodeItemsLength(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4.0,
                                      ),
                                      child: ListTileTheme(
                                        data: ListTileThemeData(
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                color: Colors.white,
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            style: ListTileStyle.drawer),
                                        child: ListTile(
                                          leading: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Image.asset(
                                              Assets.iconsTv,
                                              width: 25,
                                              height: 25,
                                            ),
                                          ),
                                          title: AutoSizeText(controller.animeEpisodesModel.data![index].title!),
                                          subtitle: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText('Filler: ${controller.animeEpisodesModel.data![index].filler}'),
                                              RatingBar(
                                                  itemSize: 10,
                                                  allowHalfRating: true,
                                                  itemPadding: const EdgeInsets.symmetric(
                                                    horizontal: 2,
                                                  ),
                                                  initialRating: controller.animeEpisodesModel.data![index].score ?? 0,
                                                  ratingWidget: RatingWidget(
                                                    full: Image.asset(
                                                      Assets.ratingStar,
                                                      width: 15,
                                                      height: 15,
                                                    ),
                                                    half: Image.asset(
                                                      Assets.ratingStar2,
                                                      width: 15,
                                                      height: 15,
                                                    ),
                                                    empty: Image.asset(
                                                      Assets.ratingStar3,
                                                      width: 15,
                                                      height: 15,
                                                    ),
                                                  ),
                                                  onRatingUpdate: (val) {})
                                            ],
                                          ),
                                          trailing: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.0),
                                            child: Icon(Icons.play_arrow),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              if (controller.paging == true)
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: SpinKitWave(
                                    color: Colors.purple,
                                    type: SpinKitWaveType.start,
                                  ),
                                )
                            ],
                          );
                        },
                        future: Future.delayed(Duration.zero),
                      );
      });

  Widget _reviewItems({required Color backgroundColor}) => Observer(builder: (context) {
        return controller.reviewsLoad
            ? Center(
                child: loadingBar(),
              )
            : controller.reviewsError
                ? const Center(
                    child: Text('Something went wrong'),
                  )
                : (controller.animeReviewsModel.data ?? []).isEmpty
                    ? const Center(
                        child: AutoSizeText('No Review Available.'),
                      )
                    : FutureBuilder(
                        builder: (context, snap) {
                          return Stack(
                            children: [
                              Scrollbar(
                                controller: _reviewScrollController,
                                child: ListView.builder(
                                  controller: _reviewScrollController,
                                  itemCount: (controller.animeReviewsModel.data ?? []).length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return _reviewItem(
                                      data: (controller.animeReviewsModel.data ?? [])[index],
                                      backgroundColor: backgroundColor,
                                    );
                                  },
                                ),
                              ),
                              if (controller.paging == true)
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: SpinKitWave(
                                    color: Colors.purple,
                                    type: SpinKitWaveType.start,
                                  ),
                                )
                            ],
                          );
                        },
                        future: Future.delayed(Duration.zero),
                      );
      });

  Widget _statsItems() => Observer(builder: (context) {
        return controller.statsLoad == true
            ? Center(
                child: loadingBar(),
              )
            : controller.statsError
                ? const Center(
                    child: Text('Something went wrong'),
                  )
                : FutureBuilder(
                    builder: (context, snap) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: 100.w,
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                controller: ScrollController(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(spaceValue: 3),
                                    const HtmlWidget(
                                      '''<h2>Summary Stats </h2>''',
                                      buildAsync: false,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                    verticalSpace(spaceValue: .5),
                                    HtmlWidget(
                                      '''<b>Watching: </b> ${controller.animeStatsModel.data!.watching}<br><br>''',
                                      buildAsync: false,
                                    ),
                                    HtmlWidget(
                                      '''<b>Completed: </b> ${controller.animeStatsModel.data!.completed}<br><br>''',
                                      buildAsync: false,
                                    ),
                                    HtmlWidget(
                                      '''<b>On-Hold: </b> ${controller.animeStatsModel.data!.onHold}<br><br>''',
                                      buildAsync: false,
                                    ),
                                    HtmlWidget(
                                      '''<b>Dropped: </b> ${controller.animeStatsModel.data!.dropped}<br><br>''',
                                      buildAsync: false,
                                    ),
                                    HtmlWidget(
                                      '''<b>Plan to watch: </b> ${controller.animeStatsModel.data!.planToWatch}<br><br>''',
                                      buildAsync: false,
                                    ),
                                    HtmlWidget(
                                      '''<b>Total: </b> ${controller.animeStatsModel.data!.total}''',
                                      buildAsync: false,
                                    ),
                                    verticalSpace(spaceValue: 3),
                                    const HtmlWidget(
                                      '''<h2>Score Stats </h2>''',
                                      buildAsync: false,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                    verticalSpace(spaceValue: .5),
                                    BarChartSample1(
                                      data: controller.animeStatsModel.data!.scores!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    future: Future.delayed(Duration.zero),
                  );
      });

  Widget get _staffView => _staffItems();

  Widget _reviewItem({required ReviewItemModel data, required Color backgroundColor}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          width: 100.w,
          height: 34.w,
          decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              /*     */ /*      mainAxisAlignment: MainAxisAlignment.start,*/ /*
              crossAxisAlignment: CrossAxisAlignment.start,*/
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(
                      data.user!.images!['jpg']!.imageUrl!,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 1.w,
                      right: 1.w,
                      top: 1.2,
                      bottom: 1.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            data.user!.username!,
                            style: GoogleFonts.workSans(
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          data.review!,
                          style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            Text(
                              (data.score ?? 0).toString(),
                              style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(Icons.thumb_up, size: 12),
                                const SizedBox(width: 4),
                                Text('${data.reactions!.overall}'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    controller.getAnimeDetails(animeId: widget.animeId);
    dominentColor = returnDominantColor(
        imageUrl: widget.image,
        callback: () async {
          await controller.getAnimeDetails(animeId: widget.animeId);
        });
    _scrollController.addListener(_scrollListener);
    _reviewScrollController.addListener(_reviewScrollListener);
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
                    ? Scaffold(
                        backgroundColor: (snapshot.data ?? Colors.blue).withOpacity(.3),
                        bottomNavigationBar: CustomBottomNavigation(
                          backgroundColor: (snapshot.data ?? Colors.blue).withOpacity(.3),
                          barColor: (snapshot.data ?? Colors.blue).withOpacity(.6),
                          activeIndex: _activeIndex,
                          onTap: (int value) {
                            setState(() {
                              _activeIndex = value;
                            });
                            switch (value) {
                              case 1:
                                controller.getAnimeStaff(
                                  animeId: controller.animeDetails.data!.malId!,
                                );
                                break;
                              case 2:
                                controller.getAnimeEpisodes(
                                  animeId: controller.animeDetails.data!.malId!,
                                );
                                break;
                              case 3:
                                controller.getAnimeStats(
                                  animeId: controller.animeDetails.data!.malId!,
                                );
                                break;
                              case 4:
                                controller.getAnimeReviews(
                                  animeId: controller.animeDetails.data!.malId!,
                                );
                                break;
                              default:
                                break;
                            }
                          },
                        ),
                        body: Container(
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
                                    child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 1000),
                                  child: _returnWidget(backgroundColor: snapshot.data ?? Colors.blue),
                                )),
                              if (!controller.loading)
                                Center(
                                  child: loadingBar(),
                                )
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: loadingBar(),
                      ));
          }),
    );
  }

  Widget get _detailsView => SingleChildScrollView(
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
                      text: '${controller.animeDetails.data!.episodes}',
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
                      text: controller.animeDetails.data!.broadcast!.string ?? '',
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
                InkWell(
                  onTap: () {
                    print(controller.animeDetails.data!.dataExternal![0].url!);
                    goToScreen(
                      routeName: browserPageRoute,
                      context: context,
                      data: '?url=${controller.animeDetails.data!.dataExternal![0].url}&title=${controller.animeDetails.data!.title}',
                    );
                  },
                  child: Row(
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
                ),
              if (controller.animeDetails.data!.dataExternal != null && controller.animeDetails.data!.dataExternal!.isNotEmpty)
                returnResourcesWidget(controller.animeDetails.data!.dataExternal ?? [], false),
              verticalSpace(spaceValue: 2),
              if (controller.animeDetails.data!.streaming != null && controller.animeDetails.data!.streaming!.isNotEmpty)
                returnResourcesWidget(controller.animeDetails.data!.streaming ?? [], title: 'Streaming Platform', true),
            ],
          ),
        ),
      );

  Widget returnResourcesWidget(
    List<External> list,
    bool shouldSkip, {
    String? title,
  }) {
    if (list.length > 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(spaceValue: 2),
          HtmlWidget(
            title != null
                ? '''<h2>$title
            </h2>'''
                : '''<h2>Resources</h2>''',
            buildAsync: false,
          ),
          verticalSpace(spaceValue: 1),
          SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                list.length,
                (index) => shouldSkip == false && index == list.length - 1
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          goToScreen(
                            routeName: browserPageRoute,
                            context: context,
                            data: '?url=${list[shouldSkip ? index : index + 1].url}&title=${controller.animeDetails.data!.title}',
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: AutoSizeText(
                            list[shouldSkip ? index : index + 1].name!,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
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
            return const SizedBox();
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

  Widget _returnWidget({required Color backgroundColor}) {
    return _activeIndex == 0
        ? _detailsView
        : _activeIndex == 1
            ? _staffView
            : _activeIndex == 2
                ? _episodeItems()
                : _activeIndex == 3
                    ? _statsItems()
                    : _reviewItems(backgroundColor: backgroundColor);
  }

  int _episodeItemsLength() {
    return controller.animeEpisodesModel.data!.length;
  }
}
