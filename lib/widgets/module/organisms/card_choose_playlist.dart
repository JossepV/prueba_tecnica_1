import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/module/molecules/button_primary.dart';
import 'package:prueba_tecnica_1/widgets/module/molecules/custom_icon_button.dart';

class ChoosePlaylistWidget extends StatefulWidget {
  const ChoosePlaylistWidget({super.key});

  @override
  State<ChoosePlaylistWidget> createState() => _ChoosePlaylistWidgetState();
}

class _ChoosePlaylistWidgetState extends State<ChoosePlaylistWidget> {
  bool _showImage = false;
  void _showDialog(BuildContext context) {
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
              child: const Text('Galería'),
              onPressed: () {
                setState(() {
                  _showImage = true;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cámara'),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189,
      width: 343,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.2)),
      child: _showImage
          ? Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://placehold.co/343x189.png',
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 10,
                  right: 60,
                  child: CustomIconButton(
                    icon: Icons.camera_alt_outlined,
                    onTap: () {},
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CustomIconButton(
                    icon: Icons.delete_outline_sharp,
                    backgroundColor: Colors.red,
                    onTap: () {
                      setState(() {
                        _showImage = false;
                      });
                    },
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Choose Playlist Thumbnail',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                ButtonPrimary(
                  label: 'Upload from Device',
                  onTap: () {
                    _showDialog(context);
                  },
                ),
                const Text(
                  'Select from content',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
    );
  }
}
