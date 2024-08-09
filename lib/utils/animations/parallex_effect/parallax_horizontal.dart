import 'package:anime_library/utils/app_export.dart';

class ParallaxHorizontalFlowDelegate extends FlowDelegate {
  ParallaxHorizontalFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    // TODO: We'll add more to this later.
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(listItemBox.size.centerLeft(Offset.zero), ancestor: scrollableBox);
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);
    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0.0);
    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize = (backgroundImageKey.currentContext!.findRenderObject() as RenderBox).size;
    final listItemSize = context.size;
    final childRect = horizontalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);
    // Paint the background.
    context.paintChild(
      0,
      transform: Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant ParallaxHorizontalFlowDelegate oldDelegate) {
    // TODO: We'll add more to this later.
    return scrollable != oldDelegate.scrollable || listItemContext != oldDelegate.listItemContext || backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
