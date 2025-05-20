import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

import '../../../core/routing/routes.dart';
import '../managers/payment/payment_bloc.dart';
import '../managers/payment/payment_state.dart';
import '../widgets/radio_button.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late final int id;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Payment Method",
        actions: [
          IconButton(
            onPressed: () => context.push(Routes.notification),
            icon: SvgPicture.asset(
              "assets/icons/notification.svg",
              width: 18.75.w,
              height: 20.25.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Divider(
            color: Color(0xffE6E6E6),
            thickness: 2,
            height: 2,
          ),
        ),
      ),
      extendBody: true,
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state.status == PaymentStatus.success) {
            return RefreshIndicator(
              onRefresh: () async => context.read<PaymentBloc>().add(PaymentLoad()),
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 13),
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
                        itemCount: state.cards.length,
                        itemBuilder: (context, index) {
                          final card = state.cards[index];
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 16.h,
                                ),
                                width: 341.w,
                                height: 52.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.greySub,
                                    width: 1.2.w,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/icons/visa.svg"),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Text(
                                        card.cardNumber,
                                        style: TextStyle(
                                          color: AppColors.blackMain,
                                          fontSize: 14.sp,
                                          fontFamily: "General Sans",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    ExampleRadio(
                                      isSelected: isSelected,
                                      onTap: () {
                                        setState(() {
                                          isSelected = !isSelected;
                                          if (isSelected) {
                                            id = card.id;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.h)
                            ],
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(Routes.newCard);
                      },
                      child: Container(
                        width: 341.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.greySub,
                            width: 1.2.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 8),
                            Text(
                              "Add New Card",
                              style: TextStyle(
                                color: AppColors.blackMain,
                                fontWeight: FontWeight.w500,
                                fontFamily: "General Sans",
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state.status == PaymentStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == PaymentStatus.error) {
            return Center(child: Text("Xatolik yuz berdi"));
          }
          return Center(child: Text("Karta ma'lumotlari yo'q"));
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 10.h,
        ),
        child: StoreAppButton(
          containerColor: AppColors.blackMain,
          text: "Apply",
          callback: () {
            if (isSelected) {
              context.pop(id);
            } else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You did not selected a card!")));
              context.pop();
            }
          },
        ),
      ),
    );
  }
}
