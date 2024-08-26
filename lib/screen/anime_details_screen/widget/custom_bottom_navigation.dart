import 'package:anime_library/utils/app_export.dart';

const List<String> _bottomIcons = [
  Assets.iconsDetails,
  Assets.iconsTeam,
  Assets.iconsVideo,
  Assets.iconsStats,
  Assets.iconsReviews,
];

class CustomBottomNavigation extends StatelessWidget {
  final Color backgroundColor, barColor;
  final int activeIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigation({
    super.key,
    required this.backgroundColor,
    required this.barColor,
    required this.activeIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Container(
        height: 60,
        width: 100.w,
        decoration: BoxDecoration(
          color: barColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-.5, -.5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _bottomIcons.length,
            (index) => InkWell(
              onTap: () => onTap(index),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _bottomIcons[index],
                      width: 25,
                      height: 25,
                      color: activeIndex == index ? Colors.amber.withOpacity(.5) : Colors.black,
                    ),
                    AutoSizeText(
                      _bottomIcons[index].replaceAll('.png', '').replaceAll('assets/icons/', '').toCapitalize(),
                      maxLines: 1,
                      style: TextStyle(
                        color: activeIndex == index ? Colors.amber.withOpacity(.5) : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
