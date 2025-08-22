import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/model/my_detail/my_detail_model.dart';
import 'package:store_app/features/auth/pages/forgot_and_reset_password_view/store_app_dialog.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';
import 'package:store_app/features/common/widgets/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/widgets/store_icon_button_container.dart';
import 'package:store_app/features/common/widgets/store_text_form_field.dart';
import 'package:store_app/features/my_details/manager/my_detail_bloc.dart';
import 'package:store_app/features/my_details/manager/my_detail_events.dart';
import 'package:store_app/features/my_details/manager/my_detail_state.dart';
import 'package:store_app/features/my_details/widgets/store_date_of_birth.dart';
import 'package:store_app/features/my_details/widgets/store_gender_box.dart';
import 'package:store_app/features/my_details/widgets/store_phone_number_feild.dart';

class MyDetailView extends StatefulWidget {
  const MyDetailView({super.key});

  @override
  State<MyDetailView> createState() => _MyDetailViewState();
}

class _MyDetailViewState extends State<MyDetailView> {
  String? selectedGender;
  DateTime? selectedDate;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<String> genderList = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "My Details",
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 24.h),
          child: Divider(color: AppColors.greySub),
        ),
      ),
      body: BlocConsumer<MyDetailBloc, MyDetailState>(
        listener: (context, state) {
          if (state.status == MyDetailStatus.success) {
            showDialog(
              context: context,
              builder:
                  (context) => StoreAppDialog(
                    title: "Muvaffaqiyatli",
                    subTitle: "Malumotlaringiz muvaffaqiyatli saqlandi.",
                    buttonTitle: "Profilga qaytish.",
                    callback: () => context.go(Routes.account),
                  ),
            );
          } else if (state.status == MyDetailStatus.error) {
            showDialog(
              context: context,
              builder:
                  (context) => StoreAppDialog(
                    image: "assets/icons/validation_error.svg",
                    title: "Xato!",
                    subTitle: state.errorMessage.toString(),
                    buttonTitle: "Qayta urinish.",
                    callback: () {
                      context.pop();
                    },
                  ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == MyDetailStatus.loading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.blackMain),
            );
          }
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                StoreTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Buni toldirishingiz kerak!";
                    }
                    return null;
                  },
                  title: "FullName",
                  hintText: "Cody Fisher",
                  controller: nameController,
                  isValid: null,
                ),
                SizedBox(height: 16.h),
                StoreTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Buni toldirishingiz kerak!";
                    }
                    return null;
                  },
                  title: "Email",
                  hintText: "cody.fisher45@example",
                  controller: emailController,
                  isValid: null,
                ),
                SizedBox(height: 16.h),
                StoreDateOfBirth(
                  title: 'Date of Birth',
                  callback: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                        dateController.text = DateFormat(
                          'yyyy-MM-dd',
                        ).format(picked);
                      });
                    }
                  },
                  controller: dateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Buni toldirishingiz kerak!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                StoreGenderBox(
                  items: genderList,
                  initialSelection: selectedGender,
                  callback: (String? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                StorePhoneNumber(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null) {
                      return "Buni toldirishingiz kerak!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 94.h),
                StoreAppButton(
                  text: "Submit",
                  callback: () {
                    print("${formKey.currentState!.validate()} $selectedGender");
                    if (formKey.currentState!.validate() &&
                        selectedGender != null) {
                      context.read<MyDetailBloc>().add(
                        MyDetailUpdate(
                          model: MyDetailModel(
                            gender: selectedGender!,
                            fullName: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            birthDate: dateController.text,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Ma'lumotlar to'liq emas!")),
                      );
                    }
                  },
                  containerColor: Colors.black,
                  containerWidth: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
