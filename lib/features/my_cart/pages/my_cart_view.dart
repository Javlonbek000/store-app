import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/my_cart/manager/my_cart_bloc.dart';
import 'package:store_app/features/my_cart/manager/my_cart_state.dart';
import 'package:store_app/features/my_cart/widgets/my_cart_button.dart';
import 'package:store_app/features/my_cart/widgets/my_cart_item.dart';

import '../../common/widgets/store_null_body.dart';
import '../widgets/my_cart_price_item.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.blackMain,
      onRefresh: () async => context.read<MyCartBloc>().add(MyCartLoad()),
      child: Scaffold(
        appBar: StoreAppBar(
          title: "My Cart",
          actions: [
            StoreIconButtonContainer(
              image: "assets/icons/notification.svg",
              callback: () => context.push(Routes.notification),
              iconHeight: 20.25,
            ),
          ],
        ),
        extendBody: true,
        body: BlocBuilder<MyCartBloc, MyCartState>(
          builder: (context, state) {
            if (state.status == MyCartStatus.loading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  backgroundColor: AppColors.white,
                ),
              );
            } else if (state.status == MyCartStatus.error) {
              return Center(
                child: Text(
                  "Xatolik yuz berdi!",
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            } else if (state.cart == null || state.cart!.items.isEmpty) {
              return StoreNullBody(
                image: "assets/icons/cart.svg",
                title: "Your Cart Is Empty!",
                subTitle: "When you add products, they’ll appear here.",
              );
            }
            return Column(
              children: [
                SizedBox(
                  width: double.infinity.w,
                  height: 363.h,
                  child: ListView.builder(
                    itemCount: state.cart!.items.length,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemBuilder:
                        (context, index) =>
                            MyCartItem(item: state.cart!.items[index]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    spacing: 16.h,
                    children: [
                      MyCartPriceItem(
                        price: state.cart!.subTotal,
                        title: 'Sub-total',
                      ),
                      MyCartPriceItem(price: state.cart!.vat, title: "VAT (%)"),
                      MyCartPriceItem(
                        price: state.cart!.shippingFee,
                        title: 'Shipping fee',
                      ),
                      Divider(color: AppColors.whiteSub),
                      MyCartPriceItem(
                        price: state.cart!.total,
                        title: 'Total',
                        titleColor: AppColors.blackMain,
                      ),
                      SizedBox(height: 35.h),
                      MyCartButton(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: StoreBottomNavigationBar(select: 4),
      ),
    );
  }
}
