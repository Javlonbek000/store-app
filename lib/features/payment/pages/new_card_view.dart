import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/store_app_dialog.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_text_form_field.dart';
import 'package:store_app/features/payment/managers/new_card/new_card_bloc.dart';
import 'package:store_app/features/payment/managers/new_card/new_card_state.dart';

class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  final formKey = GlobalKey<FormState>();

  final cardController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  void dispose() {
    cardController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "New Card",
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () => context.push(Routes.notification),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(
            color: Color(0xffE6E6E6),
            thickness: 2,
            height: 2,
          ),
        ),
      ),
      extendBody: true,
      body: BlocConsumer<NewCardBloc, NewCardState>(
        listener: (context, state) {
          if (state.status == NewCardStatus.success) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: StoreAppDialog(
                  title: "Congratulations",
                  subTitle: "Your new card has been added.",
                  buttonTitle: "Thanks",
                  buttonTitleColor: AppColors.white,
                  callback: () {
                    context.pop();
                    context.pop();
                  },
                  image: "assets/icons/dialog_success.svg",
                ),
              ),
            );
          } else if (state.status == NewCardStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMassage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 20.h,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  Text(
                    "Add Debit or Credit Card",
                    style: TextStyle(
                      color: AppColors.blackMain,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  StoreTextFormField(
                    keyboard: TextInputType.number,
                    maxLength: 16,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 16) {
                        setState(() {});
                        return "Karta raqami 16 dan kichik bolmasligi kerak!";
                      }
                      setState(() {});
                      return null;
                    },
                    title: "Card Number",
                    hintText: "Enter your card number",
                    controller: cardController,
                    isValid: null,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreTextFormField(
                        width: 165,
                        maxLength: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Sana majburiy!";
                          }
                          try {
                            final inputDate = DateTime.parse(value);
                            final now = DateTime.now();
                            if (!inputDate.isAfter(now)) {
                              return "Sana hozirgi vaqtdan katta bo'lishi kerak!";
                            }
                          } catch (e) {
                            return "Noto'g'ri sana formati. Masalan: 2025-12-01";
                          }
                          return null;
                        },
                        title: "Expiry Date",
                        hintText: "YY-MM-DD",
                        controller: expiryController,
                        isValid: null,
                        keyboard: TextInputType.number,
                      ),
                      StoreTextFormField(
                        width: 165,
                        maxLength: 4,
                        validator: (value) => null,
                        title: "Security Code",
                        hintText: "CVC",
                        controller: cvvController,
                        isValid: null,
                        keyboard: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 10.h,
        ),
        child: StoreAppButton(
          containerColor: AppColors.blackMain,
          text: "Add Card",
          callback: () {
            if (formKey.currentState!.validate()) {
              context.read<NewCardBloc>().add(
                    AddCard(
                      cardNumber: cardController.text,
                      expiryDate: expiryController.text,
                      securityCode: cvvController.text,
                    ),
                  );
            }
          },
        ),
      ),
    );
  }
}
