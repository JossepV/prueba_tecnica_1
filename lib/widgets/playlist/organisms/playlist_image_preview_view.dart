import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/custom_icon_button_view.dart';

class PlaylistImagePreviewView extends StatelessWidget {
  const PlaylistImagePreviewView({
    super.key,
    required this.onTapDelete,
    required this.onTapChange,
    this.imageUrl = '',
  });
  final VoidCallback onTapDelete;
  final VoidCallback onTapChange;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/girl.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 60,
          child: CustomIconButtonView(
            icon: Icons.camera_alt_outlined,
            onTap: onTapChange,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CustomIconButtonView(
            icon: Icons.delete_outline_sharp,
            backgroundColor: Colors.red,
            onTap: onTapDelete,
          ),
        )
      ],
    );
  }
}
