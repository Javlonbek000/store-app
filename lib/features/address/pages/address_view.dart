import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/address/managers/address/address_bloc.dart';
import 'package:store_app/features/address/managers/address/address_state.dart';
import 'package:store_app/features/address/widgets/store_address_item.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

import '../../../core/utils/colors.dart';
import '../../common/widgets/store_app_button.dart';
import '../../common/widgets/store_app_button_with_logo.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  int? selectedAddressId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Address",
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
            iconHeight: 20.25,
          ),
        ],
      ),
      extendBody: true,
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state.status == AddressStatus.success) {
            return RefreshIndicator(
              color: AppColors.blackMain,
              onRefresh:
                  () async => context.read<AddressBloc>().add(AddressLoad()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.h),
                child: Column(
                  spacing: 12.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saved Cards",
                      style: TextStyle(
                        color: AppColors.blackMain,
                        fontWeight: FontWeight.w600,
                        fontFamily: "General Sans",
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 551.h,
                      child: ListView.builder(
                        itemCount: state.addresses.length,
                        itemBuilder: (context, index) {
                          final address = state.addresses[index];
                          final isSelected = selectedAddressId == address.id;
                          return Column(
                            children: [
                              StoreAddressItem(
                                address: address,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    selectedAddressId = address.id;
                                  });
                                },
                              ),
                              SizedBox(height: 12.h),
                            ],
                          );
                        },
                      ),
                    ),
                    StoreAppButtonWithIcon(
                      image: "assets/icons/plus.svg",
                      title: "Add New Address",
                      iconWidth: 18.75,
                      iconHeight: 18.75,
                      padding: EdgeInsets.symmetric(
                        horizontal: 84.w,
                        vertical: 16.h,
                      ),
                      callback: () async {
                        await context.push(Routes.newAddress);
                        context.read<AddressBloc>().add(AddressLoad());
                      },
                      containerColor: AppColors.white,
                      borderColor: AppColors.greyMain,
                      titleColor: AppColors.blackMain,
                    ),
                  ],
                ),
              ),
            );
          } else if (state.status == AddressStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == AddressStatus.error) {
            return Center(child: Text("Xatolik yuz berdi"));
          }
          return Center(child: Text("Karta ma'lumotlari yo'q"));
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: StoreAppButton(
          containerColor: AppColors.blackMain,
          text: "Apply",
          callback: () {
            if (selectedAddressId != null) {
              final selectedAddress = context
                  .read<AddressBloc>()
                  .state
                  .addresses
                  .firstWhere((address) => address.id == selectedAddressId);
              context.pop(selectedAddress);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("You did not select a card!")),
              );
            }
          },
        ),
      ),
    );
  }
}
