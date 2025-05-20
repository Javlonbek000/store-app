import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

class StoreAppDialog extends StatelessWidget {
  const StoreAppDialog({
    super.key,
    this.containerWidth = 341,
    this.containerHeight = 292,
    this.image = "assets/icons/dialog_success.svg",
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
    this.hideButtonTitle = "No, Cancel",
    this.hideButton = false,
    required this.callback,
    this.buttonColor = AppColors.blackMain,
    this.buttonTitleColor = AppColors.blackMain,
  });

  final double containerWidth, containerHeight;
  final String image, title, subTitle, buttonTitle;
  final String hideButtonTitle;
  final bool hideButton;
  final VoidCallback callback;
  final Color buttonColor, buttonTitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: containerWidth.w,
      height: hideButton ? containerHeight.h : 336.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            image,
            width: 63.38.w,
            height: 63.38.h,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.blackMain,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: TextStyle(
              color: AppColors.blackMain,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
          StoreAppButton(
            text: buttonTitle,
            textColor: buttonTitleColor,
            callback: callback,
            containerColor: buttonColor,
            containerWidth: 293.w,
            containerHeight: 54.h,
          ),
          if (hideButton)
            StoreAppButton(
              textColor: AppColors.blackMain,
              text: hideButtonTitle,
              callback: () => context.pop(),
              containerColor: AppColors.white,
              border: Border.all(
                color: AppColors.blackMain,
                width: 1.w,
              ),
            ),
        ],
      ),
    );
  }
}
