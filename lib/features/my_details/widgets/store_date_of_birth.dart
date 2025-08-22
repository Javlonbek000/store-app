import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';

class StoreDateOfBirth extends StatefulWidget {
  const StoreDateOfBirth({
    super.key,
    required this.title,
    required this.callback,
    required this.controller,
    required this.validator,
  });

  final String title;
  final VoidCallback callback;
  final TextEditingController controller;
  final String? Function(String? value) validator;

  @override
  State<StoreDateOfBirth> createState() => _StoreDateOfBirthState();
}

class _StoreDateOfBirthState extends State<StoreDateOfBirth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h),
        GestureDetector(
          onTap: widget.callback,
          child: AbsorbPointer(
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: 'yyyy-MM-dd',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 21,
                    height: 19,
                    child: SvgPicture.asset(
                      'assets/icons/date.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
