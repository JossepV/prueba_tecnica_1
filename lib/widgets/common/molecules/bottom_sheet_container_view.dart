import 'dart:ui';

import 'package:flutter/material.dart';

class BottomSheetContainerView extends StatelessWidget {
  final double height;
  final Widget child;
  const BottomSheetContainerView({
    this.height = 0,
    super.key,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.8),
          ),
          child: Container(
            height: height,
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 4,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
