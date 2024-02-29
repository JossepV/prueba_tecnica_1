import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/models/grid_item_model.dart';
import 'package:prueba_tecnica_1/widgets/grid/molecules/grid_item_draggable_view.dart';
import 'package:prueba_tecnica_1/widgets/grid/molecules/grid_item_view.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key, required this.gridItems});
  final List<GridItemModel> gridItems;
  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 4 : 2;
    int draggingItemIndex = -1;

    // Maybe add this later to a grid controller for more complex methods
    void onReorder(int oldIndex, int newIndex) {
      setState(() {
        if (newIndex > oldIndex) {}
        final item = widget.gridItems.removeAt(oldIndex);
        widget.gridItems.insert(newIndex, item);
        draggingItemIndex = newIndex;
      });
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 0,
          childAspectRatio: 0.58),
      itemCount: widget.gridItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final isPlaceholder = draggingItemIndex == index;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: isPlaceholder
              ? Opacity(
                  opacity: 0.0,
                  child: GridItemView(
                    isMostLiked: index == 0,
                    isMostViewed: index == 3,
                    item: widget.gridItems[index],
                    isDragging: false,
                    index: index.toString(),
                  ),
                )
              : GridItemDraggableView(
                  item: widget.gridItems[index],
                  index: index,
                  onDragStarted: () => setState(() => draggingItemIndex = index),
                  onDragCompleted: () => setState(() => draggingItemIndex = -1),
                  onAccept: (int fromIndex) => onReorder(fromIndex, index),
                ),
        );
      },
    );
  }
}
