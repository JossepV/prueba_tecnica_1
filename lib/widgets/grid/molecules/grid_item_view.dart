import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/models/grid_item_model.dart';
import 'package:prueba_tecnica_1/widgets/grid/atoms/grid_item_date_likes_label_view.dart';
import 'package:prueba_tecnica_1/widgets/grid/atoms/grid_item_image_view.dart';
import 'package:prueba_tecnica_1/widgets/grid/atoms/grid_item_top_left_denotation_label_view.dart';

class GridItemView extends StatefulWidget {
  final GridItemModel item;
  final bool isDragging;
  final bool isMostLiked;
  final bool isMostViewed;
  final String index;

  const GridItemView({
    Key? key,
    required this.item,
    required this.isDragging,
    this.isMostLiked = false,
    this.isMostViewed = false,
    required this.index,
  }) : super(key: key);

  @override
  GridItemViewState createState() => GridItemViewState();
}

class GridItemViewState extends State<GridItemView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.05, end: 0.05).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: widget.isDragging ? _animation.value : 0,
          child: child,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: widget.isDragging
              ? ImageFilter.blur(sigmaX: 24, sigmaY: 24)
              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 8,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.isDragging
                  ? Theme.of(context).colorScheme.surface.withOpacity(0.3)
                  : Colors.transparent,
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                  top: widget.isDragging ? 16 : 0,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GridItemImageView(
                      widget: widget,
                    ),
                    Visibility(
                      visible: widget.item.isMostLiked || widget.item.isMostViewed,
                      child: Positioned(
                        top: 8,
                        left: widget.isDragging ? 24 : 8,
                        child: GritItemTopLeftDenotationLabelView(
                          item: widget.item,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: widget.isDragging ? 24 : 12,
                      right: widget.isDragging ? 24 : 12,
                      child: GridItemDateAndLikesLabels(
                        item: widget.item,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: widget.isDragging
                    ? const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        right: 16,
                        bottom: 16,
                      )
                    : const EdgeInsets.only(
                        left: 0,
                        top: 16,
                        right: 16,
                        bottom: 0,
                      ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
