import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/saved_category_item.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_null_body.dart';
import 'package:store_app/features/saved_items/manager/saved_items_bloc.dart';
import 'package:store_app/features/saved_items/manager/saved_items_state.dart';

class SavedItemsView extends StatelessWidget {
  const SavedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.blackMain,
      onRefresh:
          () async => context.read<SavedItemsBloc>().add(SavedItemsLoad()),
      child: Scaffold(
        appBar: StoreAppBar(
          title: "Saved Items",
          actions: [
            StoreIconButtonContainer(
              image: "assets/icons/notification.svg",
              callback: () => context.push(Routes.notification),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 24.h),
            child: Divider(color: AppColors.greySub),
          ),
        ),
        body: BlocBuilder<SavedItemsBloc, SavedItemsState>(
          builder: (context, state) {
            if (state.status == SavedItemsStatus.success) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h
                ),
                itemCount: state.savedItems.length,
                itemBuilder:
                    (context, index) =>
                        SavedCategoryItem(product: state.savedItems[index]),
              );
            } else if (state.status == SavedItemsStatus.error) {
              return Center(
                child: Text(
                  state.errorMessage.toString(),
                  style: TextStyle(
                    color: AppColors.blackMain,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else if (state.savedItems.isEmpty) {
              return StoreNullBody(
                image: "assets/icons/no_saved.svg",
                title: "No Saved Items!",
                subTitle:
                    "You don’t have any saved items. Go to home and add some.",
              );
            }
            return Center(
              child: CircularProgressIndicator(color: AppColors.blackMain),
            );
          },
        ),
        bottomNavigationBar: StoreBottomNavigationBar(),
      ),
    );
  }
}
