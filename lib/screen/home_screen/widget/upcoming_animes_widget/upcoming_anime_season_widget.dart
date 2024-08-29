import 'package:anime_library/utils/app_export.dart';

class UpComingSeasonsWidget extends StatelessWidget {
  final HomeScreenController controller;

  const UpComingSeasonsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeListItemModel>>(
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  verticalSpace(spaceValue: 5),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: HtmlWidget(
                          '''<h2>${DateTime.now().year} Upcoming Anime</h2>''',
                          buildAsync: false,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.arrow_forward),
                      )
                    ],
                  ),
                  Expanded(
                    child: GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.2,
                      ),
                      children: snapshot.data!
                          .map((e) => AnimeItemWidget(
                                itemModel: e,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              )
            : GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),

                children: List.generate(6, (index) {
                  return Card.outlined(
                    child: Center(
                      child: loadingBar(),
                    ),
                  );
                }),

                // showIndicator: true,
              );
      },
      future: controller.upcomingAnimeSeason(),
    );
  }
}
