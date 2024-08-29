import 'package:anime_library/utils/app_export.dart';
import 'package:flutter/cupertino.dart';

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

  Map<int, Widget> getBottomIconsMap() {
    return {
      for (int i = 0; i < _bottomIcons.length; i++)
        i: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              _bottomIcons[i],
              width: 25,
              height: 25,
              color: activeIndex == i ? Colors.amber.withOpacity(.5) : Colors.black,
            )),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: barColor,
      height: 50,
      width: 100.w,
      child: CupertinoSlidingSegmentedControl(
        children: getBottomIconsMap(),
        onValueChanged: (value) => onTap(value!),
      ),
    );
  }
}
