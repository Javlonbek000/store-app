import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/size/size_model.dart';
import 'package:store_app/features/common/widgets/drop_down_selector.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';

import 'filters_item.dart';

class StoreModalBottomSheet extends StatefulWidget {
  const StoreModalBottomSheet({
    super.key,
    required this.categoryId,
    required this.sizes,
  });

  final int? categoryId;
  final List<SizeModel> sizes;

  @override
  State<StoreModalBottomSheet> createState() => _StoreModalBottomSheetState();
}

class _StoreModalBottomSheetState extends State<StoreModalBottomSheet> {
  SizeModel? sizeModel;
  int select = 1;

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
              spacing: 15.h,
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
                                select = 1;
                              });
                            },
                            buttonColor:
                                select == 1
                                    ? AppColors.blackMain
                                    : AppColors.white,
                            textColor:
                                select == 1
                                    ? AppColors.white
                                    : AppColors.blackMain,
                          ),
                          StoreButtonContainer(
                            title: "Price: Low - High",
                            buttonColor:
                                select == 2
                                    ? AppColors.blackMain
                                    : AppColors.white,
                            textColor:
                                select == 2
                                    ? AppColors.white
                                    : AppColors.blackMain,
                            callback: () {
                              setState(() {
                                select = 2;
                              });
                            },
                          ),
                          StoreButtonContainer(
                            title: "Price: High - Low",
                            buttonColor:
                                select == 3
                                    ? AppColors.blackMain
                                    : AppColors.white,
                            textColor:
                                select == 3
                                    ? AppColors.white
                                    : AppColors.blackMain,
                            callback: () {
                              setState(() {
                                select = 3;
                              });
                            },
                          ),
                        ],
                      ),
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
                      DropdownSelector<SizeModel>(
                        menuEntries:
                            widget.sizes
                                .map(
                                  (e) => DropdownMenuEntry<SizeModel>(
                                    value: e,
                                    label: e.title,
                                  ),
                                )
                                .toList(),
                        callback: (value) {
                          setState(() {
                            sizeModel = value;
                          });
                        },
                        validator: (p0) {
                          return null;
                        },
                        width: 125.w,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                StoreButtonContainer(
                  title: "Apply Filters",
                  callback: () {
                    if (select == 2) {
                      context.read<HomeBloc>().add(
                        FilterProducts(
                          categoryId: widget.categoryId,
                          orderBy: "price",
                          sizeId: sizeModel?.id,
                        ),
                      );
                    } else if (select == 3) {
                      context.read<HomeBloc>().add(
                        FilterProducts(
                          categoryId: widget.categoryId,
                          orderBy: "-price",
                          sizeId: sizeModel?.id,
                        ),
                      );
                    } else {
                      context.read<HomeBloc>().add(
                        FilterProducts(
                          categoryId: widget.categoryId,
                          sizeId: sizeModel?.id,
                        ),
                      );
                    }
                    context.pop();
                  },
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
