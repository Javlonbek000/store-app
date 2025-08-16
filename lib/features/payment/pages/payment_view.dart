import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_app_button_with_logo.dart';
import 'package:store_app/features/payment/widgets/store_card_item.dart';

import '../../../core/routing/routes.dart';
import '../../auth/pages/forgot_and_reset_password_view/store_app_dialog.dart';
import '../managers/payment/payment_bloc.dart';
import '../managers/payment/payment_state.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  int? selectedCardId;

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Divider(color: Color(0xffE6E6E6), thickness: 2, height: 2),
        ),
      ),
      extendBody: true,
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state.status == PaymentStatus.success) {
            return RefreshIndicator(
              color: AppColors.blackMain,
              onRefresh:
                  () async => context.read<PaymentBloc>().add(PaymentLoad()),
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
                        itemCount: state.cards.length,
                        itemBuilder: (context, index) {
                          final card = state.cards[index];
                          final isSelected = selectedCardId == card.id;
                          return Column(
                            children: [
                              StoreCardItem(
                                card: card,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    selectedCardId = card.id;
                                  });
                                },
                                onDelete: () async {
                                  final bloc = context.read<PaymentBloc>();
                                  await showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return BlocProvider.value(
                                        value: bloc,
                                        child: BlocBuilder<
                                          PaymentBloc,
                                          PaymentState
                                        >(
                                          builder:
                                              (context, state) => Center(
                                                child: StoreAppDialog(
                                                  title: "Delete",
                                                  buttonTitleColor:
                                                      AppColors.white,
                                                  buttonColor: Colors.red,
                                                  image:
                                                      "assets/icons/validation_error.svg",
                                                  subTitle:
                                                      "You trust delete this card?",
                                                  buttonTitle: "Delete",
                                                  hideButton: true,
                                                  hideButtonTitle: "Cansel",
                                                  callback: () {
                                                    context
                                                        .read<PaymentBloc>()
                                                        .add(
                                                          DeleteCard(
                                                            id: card.id,
                                                          ),
                                                        );
                                                    context.pop();
                                                  },
                                                ),
                                              ),
                                        ),
                                      );
                                    },
                                  );
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
                      title: "Add New Card",
                      iconWidth: 18.75,
                      iconHeight: 18.75,
                      padding: EdgeInsets.symmetric(
                        horizontal: 84.w,
                        vertical: 16.h,
                      ),
                      callback: () async {
                        await context.push(Routes.newCard);
                        context.read<PaymentBloc>().add(PaymentLoad());
                      },
                      containerColor: AppColors.white,
                      borderColor: AppColors.greyMain,
                      titleColor: AppColors.blackMain,
                    ),
                  ],
                ),
              ),
            );
          } else if (state.status == PaymentStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == PaymentStatus.error) {
            return Center(
              child: Text(
                "Xatolik yuz berdi",
                style: TextStyle(
                  color: AppColors.blackMain,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
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
            if (selectedCardId != null) {
              final selectedCard = context
                  .read<PaymentBloc>()
                  .state
                  .cards
                  .firstWhere((card) => card.id == selectedCardId);
              context.pop(selectedCard);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Siz karta tanlamagansiz!")),
              );
            }
          },
        ),
      ),
    );
  }
}
