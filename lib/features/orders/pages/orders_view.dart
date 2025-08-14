import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/orders/manager/order_bloc.dart';
import 'package:store_app/features/orders/manager/order_state.dart';
import 'package:store_app/features/orders/widgets/order_item.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../common/widgets/store_icon_button_container.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  bool isOngoingSelected = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        appBar: StoreAppBar(
          title: "My Orders",
          actions: [
            StoreIconButtonContainer(
              image: 'assets/icons/notification.svg',
              callback: () => context.push(Routes.myCart),
              iconWidth: 14,
              iconHeight: 19,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(341.w, 88.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: AppColors.whiteSub,
                borderRadius: BorderRadius.circular(11),
              ),
              padding: EdgeInsets.all(11),
              child: TabBar(
                dividerColor: Colors.transparent,
                onTap: (index) {
                  setState(() {
                    isOngoingSelected = index == 0;
                  });
                },
                indicator: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Container(
                      height: 44.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Ongoing',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color:
                              isOngoingSelected
                                  ? AppColors.blackMain
                                  : AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 44.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color:
                              !isOngoingSelected
                                  ? AppColors.blackMain
                                  : AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<OrderBloc, OrderState>(
              builder:
                  (context, state) => ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) => OrderItem(model: state.orders[index],),
                  ),
            ),
            BlocBuilder<OrderBloc, OrderState>(
              builder:
                  (context, state) => ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder:
                        (context, index) => OrderItem(model: state.orders[index]),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
