import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SvgPicture.asset(
            index < rating
                ? "assets/icons/star_filled.svg"
                : "assets/icons/star_empty.svg",
            width: size,
            height: size - 2,
            colorFilter:ColorFilter.mode(
              index < rating ? Colors.transparent : const Color(0xffE6E6E6),
              BlendMode.saturation,
            ),
          ),
        );
      }),
    );
  }
}
