import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/module/molecules/grid_item.dart';

class DraggableGridItem extends StatelessWidget {
  final String item;
  final int index;
  final VoidCallback onDragStarted;
  final VoidCallback onDragCompleted;
  final Function(int) onAccept;

  const DraggableGridItem({
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
        child: GridItemWidget(
          isMostLiked: index == 0,
          isMostViewed: index == 3,
          item: item,
          isDragging: true,
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
        builder: (BuildContext context, List<dynamic> acceptedData,
            List<dynamic> rejectedData) {
          return GridItemWidget(
            isMostLiked: index == 0,
            isMostViewed: index == 3,
            item: item,
            isDragging: false,
          );
        },
      ),
    );
  }
}