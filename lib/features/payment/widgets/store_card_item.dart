import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/payment/payment_model.dart';
class StoreCardItem extends StatelessWidget {
  const StoreCardItem({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
  });

  final PaymentModel card;
  final bool isSelected;

  final VoidCallback onTap, onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onDelete,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        width: 341.w,
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.greySub, width: 1.2.w),
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/visa.svg"),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                card.cardNumber,
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 14.sp,
                  fontFamily: "General Sans",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SvgPicture.asset(
              isSelected
                  ? "assets/icons/radiobutton.svg"
                  : "assets/icons/hide_radiobutton.svg",
            ),
          ],
        ),
      ),
    );
  }
}
