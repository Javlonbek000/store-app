import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/data/model/address/address_model.dart';

import '../../../core/utils/colors.dart';

class StoreAddressItem extends StatelessWidget {
  const StoreAddressItem({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  final AddressModel address;
  final bool isSelected;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        width: 342.w,
        height: 76.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.greySub, width: 1.2.w),
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/map_pin.svg"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5.w,
                  children: [
                    Text(
                      address.title,
                      style: TextStyle(
                        color: AppColors.blackMain,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    address.isDefault
                        ? Container(
                      alignment: Alignment.center,
                          width: 52.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: AppColors.greySub,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "Default",
                            style: TextStyle(
                              color: AppColors.blackMain,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        : SizedBox.shrink(),
                  ],
                ),
                SizedBox(
                  width: 255.w,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    address.fullAddress,
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              isSelected
                  ? "assets/icons/radiobutton.svg"
                  : "assets/icons/hide_radiobutton.svg",
              width: 20.w,
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
