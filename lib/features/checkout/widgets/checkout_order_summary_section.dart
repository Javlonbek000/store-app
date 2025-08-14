import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/my_cart/widgets/my_cart_price_item.dart';

import '../../../data/model/my_cart/cart_model.dart';

class CheckoutOrderSummarySection extends StatelessWidget {
  const CheckoutOrderSummarySection({super.key, required this.promoController, required this.cart});

  final TextEditingController promoController;
  final CartModel? cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: TextStyle(
            color: AppColors.blackMain,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        MyCartPriceItem(price: cart!.subTotal, title: "Sub-total"),
        MyCartPriceItem(price: cart!.vat, title: "VAT(%)"),
        MyCartPriceItem(price: cart!.shippingFee, title: "Shipping fee"),
        Divider(color: AppColors.whiteSub),
        MyCartPriceItem(
          price: cart!.total,
          title: "Total",
          titleColor: AppColors.blackMain,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              width: 249.w,
              height: 52.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.whiteSub, width: 1.w),
              ),
              child: Row(
                spacing: 5.w,
                children: [
                  SvgPicture.asset(
                    "assets/icons/promo.svg",
                    width: 21.w,
                    height: 21.h,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: TextField(
                      controller: promoController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Search for clothes...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            StoreButtonContainer(
              title: "Add",
              textColor: AppColors.white,
              callback: () {},
              width: 84.w,
              height: 52.h,
              buttonColor: AppColors.blackMain,
            ),
          ],
        ),
      ],
    );
  }
}
