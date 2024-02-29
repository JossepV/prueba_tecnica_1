import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/data/mock_repository.dart';
import 'package:prueba_tecnica_1/widgets/grid/molecules/grid_content_header_view.dart';
import 'package:prueba_tecnica_1/widgets/floating_navigation_bar/molecules/floating_navigation_bar_view.dart';
import 'package:prueba_tecnica_1/widgets/grid/organisms/grid_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    Timer? scrollTimer;

    /// The `startScrolling` function initiates continuous scrolling in a specified direction at a
    /// constant rate.
    void startScrolling(int direction) {
      scrollTimer?.cancel();
      scrollTimer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        scrollController.jumpTo(scrollController.offset + direction * 5.0);
      });
    }

    /// The `stopScrolling` function cancels the scroll timer if it is not null.
    void stopScrolling() {
      scrollTimer?.cancel();
      scrollTimer = null;
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final double topScrollThreshold = screenHeight * 0.2;
    final double bottomScrollThreshold = screenHeight * 0.8;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Listener(
        /// This is used to allow the user to scroll up or down when dragging a item from the grid
        onPointerMove: (event) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final Offset localPosition = box.globalToLocal(event.position);
          if (localPosition.dy < topScrollThreshold) {
            startScrolling(-1);
          } else if (localPosition.dy > bottomScrollThreshold) {
            startScrolling(1);
          } else {
            stopScrolling();
          }
        },
        onPointerUp: (event) => stopScrolling(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    const GridContentHeaderView(),
                  ];
                },
                body: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 86,
                    ),
                    child: Column(
                      children: [
                        GridViewWidget(gridItems: MockRepository.items),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: FloatingNavigationBarView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
