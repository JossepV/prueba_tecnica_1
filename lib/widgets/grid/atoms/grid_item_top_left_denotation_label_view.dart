import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/models/grid_item_model.dart';

class GritItemTopLeftDenotationLabelView extends StatelessWidget {
  const GritItemTopLeftDenotationLabelView({
    super.key,
    required this.item,
  });

  final GridItemModel item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            item.isMostLiked
                ? 'Most Liked'
                : item.isMostViewed
                    ? 'Most Viewed'
                    : '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
