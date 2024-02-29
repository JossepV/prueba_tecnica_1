// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/models/grid_item_model.dart';
import 'package:prueba_tecnica_1/widgets/grid/molecules/grid_item_view.dart';

class GridItemDraggableView extends StatelessWidget {
  final GridItemModel item;
  final int index;
  final VoidCallback onDragStarted;
  final VoidCallback onDragCompleted;
  final Function(int) onAccept;

  const GridItemDraggableView({
    Key? key,
    required this.item,
    required this.index,
    required this.onDragStarted,
    required this.onDragCompleted,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<int>(
      delay: const Duration(milliseconds: 300),
      data: index,
      onDragStarted: onDragStarted,
      onDragCompleted: onDragCompleted,
      onDraggableCanceled: (_, __) => onDragCompleted(),
      feedback: Material(
        color: Colors.transparent,
        child: GridItemView(
          isMostLiked: index == 0,
          isMostViewed: index == 3,
          item: item,
          isDragging: true,
          index: index.toString(),
        ),
      ),
      childWhenDragging: Container(
        color: Colors.transparent,
      ),
      child: DragTarget<int>(
        onWillAccept: (int? fromIndex) {
          return fromIndex != index;
        },
        onAccept: onAccept,
        builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic> rejectedData) {
          return GridItemView(
            isMostLiked: index == 0,
            isMostViewed: index == 3,
            item: item,
            isDragging: false,
            index: index.toString(),
          );
        },
      ),
    );
  }
}
