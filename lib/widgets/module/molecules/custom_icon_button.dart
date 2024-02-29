import 'dart:ui';

import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton(
      {required this.icon, required this.onTap, Key? key, this.backgroundColor})
      : super(key: key);
  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;

  @override
  CustomIconButtonState createState() => CustomIconButtonState();
}

class CustomIconButtonState extends State<CustomIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _controller.forward(),
      onTapUp: (details) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.scale(
          scale: _animation.value,
          child: child,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.backgroundColor != null
                      ? [widget.backgroundColor!, widget.backgroundColor!]
                      : [
                          const Color(0xFF6C6C6C).withOpacity(0.2),
                          const Color(0xFF000000).withOpacity(0.2),
                        ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                size: 24,
                widget.icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
