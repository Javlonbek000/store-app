import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/address/address_model.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class CheckoutDeliveryAddress extends StatelessWidget {
  const CheckoutDeliveryAddress({super.key, required this.address,required this.callback});

  final AddressModel? address;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Address",
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RichText(
                text: TextSpan(
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = callback,
                  text: 'Change',
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreIconButtonContainer(
                image: "assets/icons/map_pin.svg",
                iconWidth: 17.25.w,
                iconHeight: 21.75.h,
                iconColor: AppColors.grey,
                callback: () {},
              ),
              SizedBox(width: 5.w),
              Column(
                spacing: 4.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address?.title ?? "Select Address",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 256.w,
                    child: Text(
                      address?.fullAddress ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
