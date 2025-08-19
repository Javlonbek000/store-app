import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar_item.dart';

class StoreBottomNavigationBar extends StatefulWidget {
  const StoreBottomNavigationBar({super.key, this.select});

  final int? select;

  @override
  State<StoreBottomNavigationBar> createState() =>
      _StoreBottomNavigationBarState();
}

class _StoreBottomNavigationBarState extends State<StoreBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
      width: double.infinity,
      height: 86.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.symmetric(
          horizontal: BorderSide(width: 0.5.w, color: AppColors.greySub),
        ),
      ),
      child: SizedBox(
        width: 342.w,
        height: 41.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoreBottomNavigationBarItem(
              callback: () => context.go(Routes.home),
              icon: "assets/icons/home.svg",
              iconHeight: 19.5,
              iconWidth: 18.75,
              title: "Home",
              titleColor:
                  widget.select == 1 ? AppColors.blackMain : AppColors.grey,
              iconColor:
                  widget.select == 1 ? AppColors.blackMain : AppColors.grey,
            ),
            StoreBottomNavigationBarItem(
              callback: () => context.go(Routes.search),
              icon: "assets/icons/search.svg",
              iconHeight: 20.75,
              iconWidth: 20.75,
              title: "Search",
              titleColor:
                  widget.select == 2 ? AppColors.blackMain : AppColors.grey,
              iconColor:
                  widget.select == 2 ? AppColors.blackMain : AppColors.grey,
            ),
            StoreBottomNavigationBarItem(
              callback: () => context.go(Routes.savedItems),
              icon: "assets/icons/heart.svg",
              iconHeight: 21.75,
              iconWidth: 18.75,
              title: "Saved",
              titleColor:
                  widget.select == 3 ? AppColors.blackMain : AppColors.grey,
              iconColor:
                  widget.select == 3 ? AppColors.blackMain : AppColors.grey,
            ),
            StoreBottomNavigationBarItem(
              callback: () => context.go(Routes.myCart),
              icon: "assets/icons/cart.svg",
              iconHeight: 22.13,
              iconWidth: 20.25,
              title: "Cart",
              titleColor:
                  widget.select == 4 ? AppColors.blackMain : AppColors.grey,
              iconColor:
                  widget.select == 4 ? AppColors.blackMain : AppColors.grey,
            ),
            StoreBottomNavigationBarItem(
              callback: () => context.go(Routes.account),
              icon: "assets/icons/profile.svg",
              iconHeight: 20.25,
              iconWidth: 20.25,
              title: "Account",
              titleColor:
                  widget.select == 5 ? AppColors.blackMain : AppColors.grey,
              iconColor:
                  widget.select == 5 ? AppColors.blackMain : AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
