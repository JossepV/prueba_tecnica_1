import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  const ButtonPrimary({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String label;
  final VoidCallback onTap;

  @override
  ButtonPrimaryState createState() => ButtonPrimaryState();
}

class ButtonPrimaryState extends State<ButtonPrimary>
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
    _animation = Tween<double>(begin: 1, end: 0.8).animate(
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
 onTapDown: (details) {
      _controller.forward();
    },
    onTapUp: (details) => _controller.reverse(),
    onTapCancel: () => _controller.reverse(),
    onTap: widget.onTap,
    child: IntrinsicWidth(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.45, 
        ),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform.scale(
            scale: _animation.value,
            child: child,
          ),
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF7F00FF),
                  Color(0xFFDF00FD),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8), 
              child: Text(
                widget.label,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}
