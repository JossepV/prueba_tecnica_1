import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:prueba_tecnica_1/widgets/module/molecules/icon_label.dart';

class CardListContent extends StatefulWidget {
  final Function(bool)? onCheckboxChanged;

  const CardListContent({Key? key, this.onCheckboxChanged}) : super(key: key);

  @override
  CardListContentState createState() => CardListContentState();
}

class CardListContentState extends State<CardListContent>
    with SingleTickerProviderStateMixin {
  bool _isChecked = false;
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
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: const EdgeInsets.only(right: 15),
            height: 82,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surfaceVariant,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.network('https://placehold.co/90x82.png'),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 162,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cooking mama #pastaforthe win',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      IconLabel(
                        icon: IconlyLight.time_circle,
                        label: '18 mins',
                        color: Color(0xffB19DBA),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.white.withOpacity(0.1),
                    checkboxTheme: CheckboxThemeData(
                      checkColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) => Transform.scale(
                      scale: _animation.value,
                      child: child,
                    ),
                    child: CustomCheckbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                          if (_isChecked) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                        });
                        widget.onCheckboxChanged?.call(_isChecked);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: value ? const Color(0xFFDF5BFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: value ? Colors.transparent : Colors.grey,
            width: 1,
          ),
        ),
        child: value
            ? const Icon(
                Icons.check,
                weight: 100,
                size: 17, // adjust the size of check icon
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
