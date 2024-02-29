import 'package:flutter/material.dart';

class TextButtonView extends StatelessWidget {
  const TextButtonView({
    required this.colorLabel,
    required this.onTap,
    required this.label,
    super.key,
  });
  final Color colorLabel;
  final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(color: colorLabel, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
