import 'dart:ui';

import 'package:flutter/material.dart';

class PlaylistCustomTextFieldView extends StatelessWidget {
  const PlaylistCustomTextFieldView({
    super.key,
    required this.controller,
    this.maxLines = 1,
  });
  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 51, 19, 49).withOpacity(0.3),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white.withOpacity(0.6),
            controller: controller,
            maxLines: maxLines,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
