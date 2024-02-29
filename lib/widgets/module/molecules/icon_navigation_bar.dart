import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class IconNavigationBar extends StatelessWidget {
  const IconNavigationBar({Key? key, required this.selectedIndex, required this.icon, required this.index})
      : super(key: key);

  final bool selectedIndex;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isAddIcon = index == 2;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: Container(
        key: ValueKey<bool>(selectedIndex),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isAddIcon
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                   Color(0xFF7F00FF),
                    Color(0xFFDF00FD),
                   
                  ],
                )
              : null,
        ),
        child: Icon(
          icon,
          size: selectedIndex ? 24 : 23,
          color: isAddIcon ? Colors.white : (selectedIndex ? Colors.white : Colors.white.withOpacity(0.5)),
        ),
      ),
    );
  }
}

IconData getIcon(int index) {
  switch (index) {
    case 0:
      return IconlyBold.home;
    case 1:
      return IconlyBold.play;
    case 2:
      return Icons.add;
    case 3:
      return IconlyBold.chat;
    case 4:
      return IconlyBold.profile;
    default:
      return IconlyBold.profile;
  }
}
