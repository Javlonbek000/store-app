import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class NewAddressCheckBox extends StatefulWidget {
  const NewAddressCheckBox({super.key, required this.onChanged});
  final void Function(bool value) onChanged;

  @override
  State<NewAddressCheckBox> createState() => _NewAddressCheckBoxState();
}

class _NewAddressCheckBoxState extends State<NewAddressCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
            widget.onChanged(isChecked);
          },
          checkColor: AppColors.blackMain,
        ),
        Text(
          "Make this as a default address",
          style: TextStyle(
            color: AppColors.greyMain,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
