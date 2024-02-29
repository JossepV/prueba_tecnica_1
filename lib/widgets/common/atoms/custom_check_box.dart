import 'package:flutter/material.dart';

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
                size: 17,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
