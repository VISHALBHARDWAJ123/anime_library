import 'package:anime_library/utils/app_export.dart';

class TopAnimeSlider extends StatelessWidget {
  final HomeScreenController controller;

  const TopAnimeSlider({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeListItemModel>>(
      builder: (context, snapshot) {
        return snapshot.hasData
            ? FanCarouselImageSlider.sliderType2(
                isAssets: false,
                slideViewportFraction: .9,

                autoPlay: true,
                items: List.generate(snapshot.data!.length, (index) {
                  return SlideItem(
                    itemModel: snapshot.data![index],
                  );
                }),
                constraints: BoxConstraints(
                  maxHeight: 28.h,
                ),

                // showIndicator: true,
              )
            : FanCarouselImageSlider.sliderType2(
                isAssets: false,
                slideViewportFraction: .9,

                autoPlay: true,
                items: List.generate(2, (index) {
                  return Card.outlined(
                    child: Center(
                      child: loadingBar(),
                    ),
                  );
                }),
                constraints: BoxConstraints(
                  maxHeight: 28.h,
                ),

                // showIndicator: true,
              );
      },
      future: controller.topAnimeSliderData(),
    );
  }
}
