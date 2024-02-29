import 'dart:ui';

import 'package:flutter/material.dart';

class CustomIconButtonView extends StatefulWidget {
  const CustomIconButtonView(
      {required this.icon,
      required this.onTap,
      Key? key,
      this.backgroundColor = Colors.transparent})
      : super(key: key);
  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;

  @override
  CustomIconButtonViewState createState() => CustomIconButtonViewState();
}

class CustomIconButtonViewState extends State<CustomIconButtonView>
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
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.backgroundColor != null
                      ? [widget.backgroundColor!, widget.backgroundColor!]
                      : [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surfaceVariant,
                        ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
