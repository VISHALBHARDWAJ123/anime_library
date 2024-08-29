import 'package:flutter/material.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({
    super.key,
    required this.index,
    required this.actualIndex,
    required this.sliderDuration,
    required this.imageRadius,
    required this.sidesOpacity,
    required this.sideItemsShadow,
    required this.onSlideClick,
    required this.child,
  });

  final Function onSlideClick;
  final Widget child;
  final int index;
  final int actualIndex;
  final Duration sliderDuration;

  final double imageRadius;
  final double sidesOpacity;

  final List<BoxShadow>? sideItemsShadow;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: sliderDuration,
      margin: (index == actualIndex) ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4) : const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(imageRadius),
        boxShadow: _getSlideBoxShadow(index, actualIndex),
      ),
      child: AnimatedOpacity(
        duration: sliderDuration,
        opacity: (index == actualIndex) ? 1 : sidesOpacity,
        child: InkWell(
          onTap: () => onSlideClick(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(imageRadius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  List<BoxShadow>? _getSlideBoxShadow(index, actualIndex) => (index == actualIndex) ? [] : sideItemsShadow;
}
