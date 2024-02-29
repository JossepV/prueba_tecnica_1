import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/playlist/molecules/playlist_select_image_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/molecules/playlist_image_preview_view.dart';

class PlaylistThumbnailView extends StatefulWidget {
  const PlaylistThumbnailView({super.key});

  @override
  State<PlaylistThumbnailView> createState() => _PlaylistThumbnailViewState();
}

class _PlaylistThumbnailViewState extends State<PlaylistThumbnailView> {
  bool _showImage = false;

  onTapDelete() {
    setState(() {
      _showImage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2)),
      child: _showImage
          ? PlaylistImagePreviewView(
              onTapChange: () {},
              onTapDelete: onTapDelete,
              imageUrl: '',
            )
          : PlaylistSelectImageView(
              onTap: () {
                selectImageDialog(context);
              },
            ),
    );
  }

  void selectImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.9),
          title: const Text(
            'Upload from',
            style: TextStyle(),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              child: const Text('Gallery'),
              onPressed: () {
                setState(() {
                  _showImage = true;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Camera'),
              onPressed: () {
                setState(() {
                  _showImage = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
