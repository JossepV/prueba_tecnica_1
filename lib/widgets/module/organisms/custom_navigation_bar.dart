import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/module/molecules/icon_navigation_bar.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    
    super.key,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Play'),
    Text('Add'),
    Text('Chat'),
    Text('Person'),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                  const Color(0xFF6C6C6C).withOpacity(0.2),
                  const Color(0x000000).withOpacity(0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_widgetOptions.length, (index) {
                return GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: IconNavigationBar(
                    selectedIndex: _selectedIndex == index,
                    icon: getIcon(index), index: index,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}