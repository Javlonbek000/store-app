import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/data/model/product/order/order_model.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import '../../../core/utils/colors.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.model});

  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          width: 342.w,
          height: 107.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.whiteSub, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: model.image,
                  width: 83.w,
                  height: 79.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 213.w,
                height: 79.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title,
                              style: TextStyle(
                                color: AppColors.blackMain,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Size ${model.size}",
                              style: TextStyle(
                                color: AppColors.greyMain,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteSub,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            model.status,
                            style: TextStyle(
                              color: AppColors.blackMain,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$ ${model.price}",
                          style: TextStyle(
                            color: AppColors.blackMain,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        StoreAppButton(
                          text: "Track Order",
                          textSize: 10,
                          containerWidth: 90,
                          containerHeight: 30,
                          containerColor: AppColors.blackMain,
                          callback: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
