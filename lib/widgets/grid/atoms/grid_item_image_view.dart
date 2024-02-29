import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/grid/molecules/grid_item_view.dart';
import 'package:shimmer/shimmer.dart';

class GridItemImageView extends StatelessWidget {
  const GridItemImageView({
    super.key,
    required this.widget,
  });

  final GridItemView widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.isDragging ? 16 : 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: widget.item.imageUrl,
          width: 190,
          height: 220,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 190,
              height: 220,
              color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
