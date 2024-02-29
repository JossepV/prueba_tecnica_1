import 'dart:ui';

import 'package:flutter/material.dart';

class BottomSheetIconButtonView extends StatefulWidget {
  const BottomSheetIconButtonView(
      {required this.icon,
      required this.onTap,
      Key? key,
      this.color = Colors.white,
      this.label = ""})
      : super(key: key);
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final String label;

  @override
  BottomSheetIconButtonViewState createState() => BottomSheetIconButtonViewState();
}

class BottomSheetIconButtonViewState extends State<BottomSheetIconButtonView>
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Icon(
                      widget.icon,
                      color: widget.color,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
