import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class MyCartPriceItem extends StatelessWidget {
  const MyCartPriceItem({
    super.key,
    required this.price,
    required this.title,
    this.titleSize = 16,
    this.priceSize = 16,
    this.titleWeight = FontWeight.w400,
    this.priceWeight = FontWeight.w500,
    this.titleColor = AppColors.greyMain,
  });

  final int price;
  final String title;
  final double titleSize, priceSize;
  final FontWeight titleWeight, priceWeight;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: titleSize.sp,
            fontWeight: titleWeight,
          ),
        ),
        Text(
          "\$ $price",
          style: TextStyle(
            color: AppColors.blackMain,
            fontSize: priceSize.sp,
            fontWeight: priceWeight,
          ),
        ),
      ],
    );
  }
}
