import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/button_primary_view.dart';

class PlaylistSelectImageView extends StatelessWidget {
  const PlaylistSelectImageView({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Choose Playlist Thumbnail',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        ButtonPrimaryView(
          label: 'Upload from Device',
          onTap: onTap,
        ),
        const Text(
          'Select from content',
          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
