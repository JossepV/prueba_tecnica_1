import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/bottom_sheet_container_view.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/bottom_sheet_icon_button_view.dart';

class ActionsBottomSheet extends StatelessWidget {
  const ActionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height * 0.2;
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomSheetContainerView(
              height: maxHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomSheetIconButtonView(
                    icon: Icons.edit_outlined,
                    onTap: () {},
                    label: "Edit",
                  ),
                  BottomSheetIconButtonView(
                    icon: Icons.share_outlined,
                    onTap: () {},
                    label: "Share",
                  ),
                  BottomSheetIconButtonView(
                    icon: Icons.archive_outlined,
                    onTap: () {},
                    label: "Archive",
                  ),
                  BottomSheetIconButtonView(
                    icon: Icons.delete_outline,
                    color: Colors.red,
                    onTap: () {},
                    label: "Remove",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
