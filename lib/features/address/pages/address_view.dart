import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/store_app_button.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Address", actions: [
        StoreIconButtonContainer(
          image: "assets/icons/notification.svg",
          callback: () => context.push(Routes.notification),
          iconHeight: 20.25,
        ),
      ]),
      extendBody: true,
      body: ListView(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: StoreAppButton(
          text: "Apply",
          callback: () {},
          containerColor: AppColors.blackMain,
        ),
      ),
    );
  }
}
