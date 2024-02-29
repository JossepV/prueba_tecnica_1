import 'package:flutter/material.dart';

class FloatingNavigationBarIconView extends StatelessWidget {
  const FloatingNavigationBarIconView(
      {Key? key, required this.selectedIndex, required this.icon, required this.index, this.onTap})
      : super(key: key);

  final bool selectedIndex;
  final IconData icon;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool isAddIcon = index == 2;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        key: ValueKey<bool>(selectedIndex),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isAddIcon
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.primary,
                  ],
                )
              : null,
        ),
        child: Icon(
          icon,
          size: selectedIndex ? 24 : 23,
          color: isAddIcon
              ? Colors.white
              : (selectedIndex ? Colors.white : Colors.white.withOpacity(0.5)),
        ),
      ),
    );
  }
}
