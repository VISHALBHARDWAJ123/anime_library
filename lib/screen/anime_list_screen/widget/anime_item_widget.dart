import 'package:anime_library/utils/app_export.dart';

class AnimeItemWidget extends StatefulWidget {
  final AnimeListItemModel itemModel;

  const AnimeItemWidget({
    super.key,
    required this.itemModel,
  });

  @override
  State<AnimeItemWidget> createState() => _AnimeItemWidgetState();
}

class _AnimeItemWidgetState extends State<AnimeItemWidget> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => goToScreen(
          routeName: animeDetailsPageRoute,
          data: '?image=${widget.itemModel.images!['jpg']!.imageUrl}&animeId=${widget.itemModel.malId}',
          context: context,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  final backgroundKey = GlobalKey();

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: backgroundKey,
      ),
      children: [
        CachedNetworkImage(
          imageUrl: widget.itemModel.images!['jpg']!.largeImageUrl!,
          key: backgroundKey,
          fit: BoxFit.cover,
          placeholder: (
            _,
            s,
          ) =>
              ClipRRect(borderRadius: BorderRadius.circular(25), child: loadingBar()),
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 5,
      bottom: 10,
      right: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            widget.itemModel.titleEnglish ?? widget.itemModel.titleJapanese!,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          widget.itemModel.score != null
              ? AutoSizeText(
                  'Total score: ${widget.itemModel.score}/10',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
