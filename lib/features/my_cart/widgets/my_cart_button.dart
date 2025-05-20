import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';

class MyCartButton extends StatelessWidget {
  const MyCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.checkout),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 90.w),
        alignment: Alignment.center,
        width: 341.w,
        height: 54.h,
        decoration: BoxDecoration(
          color: AppColors.blackMain,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: 10.w,
          children: [
            Text(
              'Go To Checkout',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/arrow.svg",
              width: 14.w,
              height: 14.h,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
