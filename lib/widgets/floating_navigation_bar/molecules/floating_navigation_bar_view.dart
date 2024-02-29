import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:prueba_tecnica_1/controllers/main_screen_controller.dart';
import 'package:prueba_tecnica_1/widgets/floating_navigation_bar/atoms/floating_navigation_bar_icon_view.dart';

class FloatingNavigationBarView extends StatefulWidget {
  const FloatingNavigationBarView({
    super.key,
  });

  @override
  State<FloatingNavigationBarView> createState() => _FloatingNavigationBarViewState();
}

class _FloatingNavigationBarViewState extends State<FloatingNavigationBarView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surfaceVariant,
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              FloatingNavigationBarIconView(
                selectedIndex: _selectedIndex == 0,
                icon: IconlyBold.home,
                index: 0,
                onTap: () {
                  onItemTapped(0);
                },
              ),
              FloatingNavigationBarIconView(
                selectedIndex: _selectedIndex == 1,
                icon: IconlyBold.play,
                index: 1,
                onTap: () {
                  onItemTapped(1);
                },
              ),
              FloatingNavigationBarIconView(
                selectedIndex: _selectedIndex == 2,
                icon: Icons.add,
                index: 2,
                onTap: () {
                  onItemTapped(2);
                  MainScreenController.showCreateNewPlaylistBottomSheet(context);
                },
              ),
              FloatingNavigationBarIconView(
                selectedIndex: _selectedIndex == 3,
                icon: IconlyBold.chat,
                index: 3,
                onTap: () {
                  onItemTapped(3);
                },
              ),
              FloatingNavigationBarIconView(
                selectedIndex: _selectedIndex == 4,
                icon: IconlyBold.profile,
                index: 4,
                onTap: () {
                  onItemTapped(4);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
