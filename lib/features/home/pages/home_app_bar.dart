import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_button_container.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_text_form_field.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';
import 'package:store_app/features/home/widgets/store_modal_bottom_sheet.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.categoryId});

  final int? categoryId;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 170.h);
}

class _HomeAppBarState extends State<HomeAppBar> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<HomeBloc>().add(
      FilterProducts(title: controller.text, categoryId: widget.categoryId),
    );
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanged);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: AppBar(
        toolbarHeight: 91.h,
        title: Row(
          children: [
            Text(
              "Discover",
              style: TextStyle(
                color: AppColors.blackMain,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 98.h),
          child: Column(
            spacing: 8.h,
            children: [
              Row(
                spacing: 8.w,
                children: [
                  StoreTextFormField(
                    width: 280.h,
                    validator: (value) {
                      return null;
                    },
                    title: '',
                    titleBool: false,
                    hintText: "Search for clothes...",
                    controller: controller,
                    isValid: null,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: bloc,
                            child: StoreModalBottomSheet(
                              sizes: bloc.state.sizes,
                              categoryId: widget.categoryId,
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.blackMain,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/filters.svg",
                        width: 20.25.w,
                        height: 18.75.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36.h,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder:
                      (context, state) => ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          StoreButtonContainer(
                            title: "All",
                            callback: () {
                              context.read<HomeBloc>().add(
                                FilterProducts(
                                  categoryId: null,
                                  title: controller.text.trim(),
                                ),
                              );
                            },
                            textColor:
                                state.selectedCategory == null
                                    ? AppColors.white
                                    : AppColors.blackMain,
                            buttonColor:
                                state.selectedCategory == null
                                    ? AppColors.blackMain
                                    : AppColors.white,
                          ),
                          SizedBox(width: 10.w),

                          ...state.categories.map(
                            (category) => Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: StoreButtonContainer(
                                title: category.title,
                                callback: () {
                                  context.read<HomeBloc>().add(
                                    FilterProducts(
                                      categoryId: category.id,
                                      title: controller.text.trim(),
                                    ),
                                  );
                                },
                                textColor:
                                    state.selectedCategory == category.id
                                        ? AppColors.white
                                        : AppColors.blackMain,
                                buttonColor:
                                    state.selectedCategory == category.id
                                        ? AppColors.blackMain
                                        : AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
