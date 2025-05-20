import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/manager/checkout_bloc.dart';
import 'package:store_app/features/checkout/manager/checkout_state.dart';
import 'package:store_app/features/checkout/widgets/checkout_delivery_address.dart';
import 'package:store_app/features/checkout/widgets/payment_button.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_text_form_field.dart';
import 'package:store_app/features/my_cart/widgets/my_cart_price_item.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedPayment = 'Card';
  final promoController = TextEditingController();
  final cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: 'Checkout',
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
            iconHeight: 20.25,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 24.h),
            child: Divider(color: AppColors.whiteSub)),
      ),
      extendBody: true,
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state.status == CheckoutStatus.success) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
              children: [
                CheckoutDeliveryAddress(),
                Divider(color: AppColors.whiteSub),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 16.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Method",
                        style: TextStyle(
                          color: AppColors.blackMain,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PaymentButton(
                            image: "assets/icons/card.svg",
                            title: "Card",
                            callback: () {
                              setState(() {
                                selectedPayment = 'Card';
                              });
                            },
                            color: selectedPayment == 'Card'
                                ? AppColors.blackMain
                                : AppColors.white,
                            iconColor: selectedPayment == 'Card'
                                ? Colors.white
                                : AppColors.blackMain,
                            titleColor: selectedPayment == 'Card'
                                ? Colors.white
                                : AppColors.blackMain,
                          ),
                          PaymentButton(
                            image: "assets/icons/cash.svg",
                            title: "Cash",
                            callback: () {
                              setState(() {
                                selectedPayment = 'Cash';
                              });
                            },
                            color: selectedPayment == 'Cash'
                                ? AppColors.blackMain
                                : AppColors.white,
                            iconColor: selectedPayment == 'Cash'
                                ? Colors.white
                                : AppColors.blackMain,
                            titleColor: selectedPayment == 'Cash'
                                ? Colors.white
                                : AppColors.blackMain,
                          ),
                        ],
                      ),
                      if (selectedPayment == 'Card')
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5.h,
                          children: [
                            StoreTextFormField(
                              width: 290,
                              validator: (value) => null,
                              titleBool: false,
                              title: "",
                              hintText: "Enter your card",
                              controller: cardController,
                              isValid: null,
                              keyboard: TextInputType.number,
                              maxLength: 16,
                            ),
                            StoreIconButtonContainer(
                              image: "assets/icons/pencil.svg",
                              callback: () => context.push(Routes.payment),
                              borderRadius: BorderRadius.circular(10),
                              containerHeight: 52,
                              containerWidth: 46,
                              containerColor: AppColors.blackMain,
                              iconColor: AppColors.white,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Divider(color: AppColors.whiteSub),
                Column(
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
                    MyCartPriceItem(
                        price: state.cart!.subTotal, title: "Sub-total"),
                    MyCartPriceItem(price: state.cart!.vat, title: "VAT(%)"),
                    MyCartPriceItem(
                        price: state.cart!.shippingFee, title: "Shipping fee"),
                    Divider(color: AppColors.whiteSub),
                    MyCartPriceItem(
                        price: state.cart!.total,
                        title: "Total",
                        titleColor: AppColors.blackMain),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 14.h),
                          width: 249.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.whiteSub,
                              width: 1.w,
                            ),
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
                    )
                  ],
                ),
              ],
            );
          } else if (state.status == CheckoutStatus.error) {
            return Center(child: Text("Xatoo!"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: StoreAppButton(
          text: "Place Order",
          callback: () {},
          containerColor: AppColors.blackMain,
        ),
      ),
    );
  }
}
