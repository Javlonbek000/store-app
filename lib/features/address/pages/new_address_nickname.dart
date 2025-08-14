import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class NewAddressNickname extends StatelessWidget {
  const NewAddressNickname({super.key, required this.address});

  final String? address;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address Nickname",
            style: TextStyle(
              color: AppColors.blackMain,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: 341.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.whiteSub, width: 1.w),
            ),
            child: Text(
              address!,
              style: TextStyle(
                color: AppColors.blackMain,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
