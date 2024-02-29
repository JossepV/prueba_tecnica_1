import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/controllers/main_screen_controller.dart';
import 'package:prueba_tecnica_1/data/mock_repository.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/custom_icon_button_view.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/icon_label_view.dart';
import 'package:prueba_tecnica_1/widgets/grid/molecules/grid_header_view.dart';
import 'package:prueba_tecnica_1/widgets/grid/utils/get_current_time.dart';

class GridContentHeaderView extends StatelessWidget {
  const GridContentHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 260.0,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CustomIconButtonView(
            icon: Icons.arrow_back_ios_new_outlined,
            onTap: () {},
          ),
        ),
      ),
      actions: const [],
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double top = constraints.biggest.height;
          return Stack(
            fit: StackFit.expand,
            children: [
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/girl.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Theme.of(context).colorScheme.background.withOpacity(0.5),
                          Theme.of(context).colorScheme.background,
                        ],
                      ),
                    ),
                    child: Container(),
                  ),
                ],
              ),
              FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.all(0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    top <= MediaQuery.of(context).padding.top + kToolbarHeight
                        ? Padding(
                            padding: const EdgeInsets.only(left: 64, top: 32),
                            child: GridHeaderView(
                              videoAmountString: MockRepository.items.length.toString(),
                              hour: getCurrentTimeString(),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(left: top < 140 ? 56 : 16),
                            child: SizedBox(
                              height: 80,
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GridHeaderView(
                                    videoAmountString: MockRepository.items.length.toString(),
                                    hour: getCurrentTimeString(),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Row(
                                    children: [
                                      IconLabelView(icon: Icons.lock_outline, label: "Private"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      IconLabelView(icon: Icons.visibility, label: "5.2K")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                    Padding(
                      padding: top < 110
                          ? const EdgeInsets.only(top: 18)
                          : const EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomIconButtonView(
                              icon: Icons.edit_outlined,
                              onTap: () {
                                MainScreenController.showCreateNewPlaylistBottomSheet(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomIconButtonView(
                              icon: Icons.more_vert,
                              onTap: () {
                                MainScreenController.showActionsBottomSheet(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                background: Stack(
                  children: <Widget>[
                    Container(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
