import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/common/organisms/actions_bottom_sheet_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/organisms/playlist_create_bottom_sheet_view.dart';

class MainScreenController {
  static void showActionsBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return const ActionsBottomSheet();
      },
    );
  }

  static void showCreateNewPlaylistBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return const PlaylistCreateBottomSheetView();
      },
    );
  }
}
