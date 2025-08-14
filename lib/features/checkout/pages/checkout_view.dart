import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/payment/payment_model.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/store_app_dialog.dart';
import 'package:store_app/features/checkout/manager/checkout_bloc.dart';
import 'package:store_app/features/checkout/manager/checkout_state.dart';
import 'package:store_app/features/checkout/widgets/checkout_order_summary_section.dart';
import 'package:store_app/features/checkout/widgets/checkout_delivery_address.dart';
import 'package:store_app/features/checkout/widgets/payment_button.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

import '../../../data/model/address/address_model.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedPayment = 'Card';
  final promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state.status == CheckoutStatus.added) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder:
                (context) => Center(
                  child: StoreAppDialog(
                    title: "Congratulations!",
                    subTitle: "Your order has been placed.",
                    buttonTitle: "Check Your Cart",
                    callback: () {
                      context.go(Routes.home);
                    },
                  ),
                ),
          );
        } else if (state.status == CheckoutStatus.unAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage.toString())),
          );
        }
      },
      builder: (context, state) {
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
              child: Divider(color: AppColors.whiteSub),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
            children: [
              CheckoutDeliveryAddress(
                address: state.address,
                callback: () async {
                  final address =
                      await context.push(Routes.address) as AddressModel;
                  context.read<CheckoutBloc>().add(
                    CheckoutSelectAddress(address: address),
                  );
                },
              ),
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
                          color:
                              selectedPayment == 'Card'
                                  ? AppColors.blackMain
                                  : AppColors.white,
                          iconColor:
                              selectedPayment == 'Card'
                                  ? Colors.white
                                  : AppColors.blackMain,
                          titleColor:
                              selectedPayment == 'Card'
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
                          color:
                              selectedPayment == 'Cash'
                                  ? AppColors.blackMain
                                  : AppColors.white,
                          iconColor:
                              selectedPayment == 'Cash'
                                  ? Colors.white
                                  : AppColors.blackMain,
                          titleColor:
                              selectedPayment == 'Cash'
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
                          Container(
                            alignment: Alignment.center,
                            width: 290.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.whiteSub,
                                width: 1.w,
                              ),
                            ),
                            child: Text(
                              state.card?.cardNumber ?? "Select card",
                              style: TextStyle(
                                color: AppColors.blackMain,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          StoreIconButtonContainer(
                            image: "assets/icons/pencil.svg",
                            callback: () async {
                              final card =
                                  await context.push(Routes.payment)
                                      as PaymentModel;
                              context.read<CheckoutBloc>().add(
                                CheckoutSelectCard(card: card),
                              );
                            },
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
              state.cart == null
                  ? Center(child: CircularProgressIndicator())
                  : CheckoutOrderSummarySection(
                    promoController: promoController,
                    cart: state.cart,
                  ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: StoreAppButton(
              text: "Place Order",
              callback: () {
                if (state.address != null && selectedPayment == 'Cash') {
                  context.read<CheckoutBloc>().add(
                    CheckoutAddOrder(
                      addressId: state.address!.id,
                      cardId: state.card?.id,
                      paymentMethod: selectedPayment,
                    ),
                  );
                } else if (state.address != null && state.card != null) {
                  context.read<CheckoutBloc>().add(
                    CheckoutAddOrder(
                      addressId: state.address!.id,
                      cardId: state.card?.id,
                      paymentMethod: selectedPayment,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Ma'lumotlarni to'liq kiritmadingiz!"),
                    ),
                  );
                }
              },
              containerColor: AppColors.blackMain,
            ),
          ),
        );
      },
    );
  }
}
