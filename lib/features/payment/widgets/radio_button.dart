import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExampleRadio extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const ExampleRadio({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        isSelected
            ? "assets/icons/hide_radiobutton.svg"
            : "assets/icons/radiobutton.svg",
      ),
    );
  }
}
