import 'package:flutter/material.dart';

class LiveLabel extends StatelessWidget {
  const LiveLabel({required this.cuantityVideo, required this.hour, super.key});
  final String cuantityVideo;
  final String hour;
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white.withOpacity(0.7);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Live Video Calls',
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        Row(
          children: [
            label(color: color, label: '$cuantityVideo videos'),
            label(color: color, label: ' | '),
            label(color: color, label: hour),
          ],
        )
      ],
    );
  }

  Text label({required Color color, required String label}) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: 14),
    );
  }
}
