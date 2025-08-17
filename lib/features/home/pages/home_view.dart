import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/home_category_item.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/manager/home_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';
import 'package:store_app/features/home/pages/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        categoryId: context.select(
          (HomeBloc bloc) => bloc.state.selectedCategory,
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.success) {
            return RefreshIndicator(
              color: AppColors.blackMain,
              onRefresh: () async {
                if (state.status == HomeStatus.success) {
                  context.read<HomeBloc>().add(
                    HomeLoad(),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 10.h),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 231.h,
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.h,
                    crossAxisSpacing: 10.w,
                  ),
                  itemCount: state.products.length,
                  itemBuilder:
                      (context, index) =>
                          HomeProductItem(model: state.products[index]),
                ),
              ),
            );
          } else if (state.status == HomeStatus.error) {
            return Center(
              child: Text(
                "Xatolik yuz berdi!",
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.blackMain),
            );
          }
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
