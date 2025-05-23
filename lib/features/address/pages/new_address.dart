import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/address/managers/new_address/new_address_bloc.dart';
import 'package:store_app/features/address/managers/new_address/new_address_events.dart';
import 'package:store_app/features/address/managers/new_address/new_address_state.dart';
import 'package:store_app/features/address/widgets/new_address_check_box.dart';
import 'package:store_app/features/address/widgets/new_address_drop_down.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/store_app_dialog.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewAddressBloc>();
    String selectedValue = "";
    bool isDefault = false;
    return Scaffold(
      appBar: StoreAppBar(
        title: "New Address",
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
          ),
        ],
      ),
      body: BlocConsumer<NewAddressBloc, NewAddressState>(
        listener: (context, state) async {
          if (state.status == NewAddressStatus.selected) {
            await showModalBottomSheet(
              context: context,
              isDismissible: false,
              barrierColor: Colors.transparent,
              builder: (context) {
                return BlocProvider.value(
                  value: bloc,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 30.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    width: double.infinity,
                    height: 403.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Address",
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
                        Divider(color: AppColors.whiteSub, height: 1.h),
                        SizedBox(
                          width: 341.w,
                          height: 78.h,
                          child: NewAddressDropDown(
                            onChanged: (String value) {
                              selectedValue = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 78.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address Nickname",
                                style: TextStyle(
                                  color: AppColors.blackMain,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 341.w,
                                height: 52.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.whiteSub,
                                    width: 1.w,
                                  ),
                                ),
                                child: Text(
                                  state.address!,
                                  style: TextStyle(
                                    color: AppColors.blackMain,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        NewAddressCheckBox(
                          onChanged: (bool value) {
                            isDefault = value;
                          },
                        ),
                        StoreAppButton(
                          text: "Add",
                          callback: () {
                            bloc.add(
                              AddNewAddress(
                                title: selectedValue,
                                fullAddress: state.address!,
                                lat: state.currentLocation!.latitude,
                                lng: state.currentLocation!.longitude,
                                isDefault: isDefault,
                              ),
                            );
                          },
                          containerColor: AppColors.blackMain,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state.status == NewAddressStatus.success) {
            showDialog(
              context: context,
              builder:
                  (context) => Center(
                    child: StoreAppDialog(
                      title: "Congratulations",
                      subTitle: "Your new address has been added.",
                      buttonTitle: "Thanks",
                      buttonTitleColor: AppColors.white,
                      callback: () => context.go(Routes.address),
                    ),
                  ),
            );
          } else if (state.status == NewAddressStatus.error) {
            showDialog(
              context: context,
              builder:
                  (context) => Center(
                    child: StoreAppDialog(
                      image: 'assets/icons/warning.svg',
                      title: "Error",
                      subTitle: state.errorMassage!,
                      buttonTitle: "Back",
                      buttonTitleColor: AppColors.white,
                      callback: () => context.pop(),
                    ),
                  ),
            );
          }
        },
        builder:
            (context, state) => Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: context.read<NewAddressBloc>().controller,
                    options: MapOptions(
                      initialCenter: LatLng(
                        41.285799883900715,
                        69.20363493014382,
                      ),
                      onTap: (tapPosition, point) {
                        context.read<NewAddressBloc>().add(
                          NewAddressChooseLocation(chosenLocation: point),
                        );
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: state.markers),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Address: ${state.address}'),
                ),
              ],
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => context.read<NewAddressBloc>().add(GoToCurrentLocation()),
        tooltip: 'Go to current location',
        child: Icon(Icons.my_location, color: AppColors.blackMain),
      ),
    );
  }
}
