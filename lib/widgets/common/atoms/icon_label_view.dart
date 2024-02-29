import 'package:flutter/material.dart';

class IconLabelView extends StatelessWidget {
  const IconLabelView({required this.icon, required this.label, this.color = Colors.white, super.key});
  final IconData icon;
  final String label;
  final Color? color ;
  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
          size:10,
        ),
        const SizedBox(width: 5,),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 10),
        ),
      ],
    );
  }
}
