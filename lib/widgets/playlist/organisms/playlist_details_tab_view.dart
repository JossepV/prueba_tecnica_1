import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/playlist/molecules/playlist_custom_text_field_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/molecules/playlist_thumbnail_view.dart';

class DetailsTabView extends StatelessWidget {
  const DetailsTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const PlaylistThumbnailView(),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Playlist Name',
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        PlaylistCustomTextFieldView(
          controller: TextEditingController(),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Description',
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        PlaylistCustomTextFieldView(
          controller: TextEditingController(),
          maxLines: 10,
        ),
      ]),
    );
  }
}