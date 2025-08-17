import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';
import 'package:store_app/features/home/widgets/store_drop_down_button.dart';

import 'filters_item.dart';

class StoreModalBottomSheet extends StatefulWidget {
  const StoreModalBottomSheet({super.key});

  @override
  State<StoreModalBottomSheet> createState() => _StoreModalBottomSheetState();
}

class _StoreModalBottomSheetState extends State<StoreModalBottomSheet> {
  bool? select;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder:
          (context, state) => Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            width: double.infinity,
            height: 405.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              spacing: 7.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filters",
                      style: TextStyle(
                        color: AppColors.blackMain,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.pop();
                        context.read<HomeBloc>().add(HomeLoad());
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/x.svg",
                        width: 15.76.w,
                        height: 15.76.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.greySub),
                Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FiltersItem(title: "Sort By", subTitle: ""),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 10.w,
                        children: [
                          StoreButtonContainer(
                            title: "Relevance",
                            callback: () {
                              setState(() {
                                select = null;
                              });
                              context.read<HomeBloc>().add(
                                HomeLoad(
                                ),
                              );
                            },
                            buttonColor:
                                select == null
                                    ? AppColors.blackMain
                                    : AppColors.white,
                            textColor:
                                select == null
                                    ? AppColors.white
                                    : AppColors.blackMain,
                          ),
                          StoreButtonContainer(
                            title: "Price: Low - High",
                            buttonColor:
                                select == true
                                    ? AppColors.blackMain
                                    : AppColors.white,
                            textColor:
                                select == true
                                    ? AppColors.white
                                    : AppColors.blackMain,
                            callback: () {
                              setState(() {
                                select = true;
                              });
                              context.read<HomeBloc>().add(
                                HomeLoad(

                                ),
                              );
                            },
                          ),
                          StoreButtonContainer(
                            title: "Price: High - Low",
                            buttonColor:
                            select == false
                                ? AppColors.blackMain
                                : AppColors.white,
                            textColor:
                            select == false
                                ? AppColors.white
                                : AppColors.blackMain,
                            callback: () {
                              setState(() {
                                select = false;
                              });
                              context.read<HomeBloc>().add(
                                HomeLoad(

                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.greySub),
                Column(
                  spacing: 10.h,
                  children: [
                    FiltersItem(title: "Price", subTitle: "\$ 0 - \$ 19"),
                    Container(
                      width: double.infinity,
                      height: 20,
                      color: AppColors.blackMain,
                    ),
                  ],
                ),
                Divider(color: AppColors.greySub),
                SizedBox(
                  height: 22.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Size",
                        style: TextStyle(
                          color: AppColors.blackMain,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      StoreDropDownButton(),
                    ],
                  ),
                ),
                StoreButtonContainer(
                  title: "Apply Filters",
                  callback: () {},
                  width: 341.w,
                  height: 54.h,
                  buttonColor: AppColors.blackMain,
                  textColor: AppColors.white,
                ),
              ],
            ),
          ),
    );
  }
}
