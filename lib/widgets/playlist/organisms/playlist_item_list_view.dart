import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:prueba_tecnica_1/models/grid_item_model.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/custom_check_box.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/icon_label_view.dart';
import 'package:shimmer/shimmer.dart';

class PlaylistItemListView extends StatefulWidget {
  final Function(bool)? onCheckboxChanged;
  final GridItemModel gridItemModel;
  const PlaylistItemListView({Key? key, this.onCheckboxChanged, required this.gridItemModel})
      : super(key: key);

  @override
  PlaylistItemListViewState createState() => PlaylistItemListViewState();
}

class PlaylistItemListViewState extends State<PlaylistItemListView>
    with SingleTickerProviderStateMixin {
  bool _isChecked = false;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: const EdgeInsets.only(right: 15),
            height: 82,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surfaceVariant,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 90,
                  width: 82,
                  child: CachedNetworkImage(
                    imageUrl: widget.gridItemModel.imageUrl,
                    width: 90,
                    height: 82,
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
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 162,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.gridItemModel.description,
                        maxLines: 3,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      IconLabelView(
                        icon: IconlyLight.time_circle,
                        label: '${widget.gridItemModel.likes} mins',
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.white.withOpacity(0.1),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) => Transform.scale(
                      scale: _animation.value,
                      child: child,
                    ),
                    child: CustomCheckbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                          if (_isChecked) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                        });
                        widget.onCheckboxChanged?.call(_isChecked);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
