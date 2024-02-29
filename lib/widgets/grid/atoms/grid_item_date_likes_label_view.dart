import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/models/grid_item_model.dart';

class GridItemDateAndLikesLabels extends StatelessWidget {
  const GridItemDateAndLikesLabels({
    super.key,
    required this.item,
  });

  final GridItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.date,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        Row(
          children: [
            const Icon(
              Icons.favorite_outline,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "${item.likes}.0k",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}
