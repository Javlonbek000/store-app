import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class NewAddressDropDown extends StatefulWidget {
  const NewAddressDropDown({super.key, required this.onChanged});

  final void Function(String value) onChanged;

  @override
  State<NewAddressDropDown> createState() => _NewAddressDropDownState();
}

class _NewAddressDropDownState extends State<NewAddressDropDown> {
  final List<String> names = ['Home', "Office", "University"];
  String selectedValue = "Choose one";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        DropdownMenu<String>(
          width: 341.w,
          initialSelection: selectedValue,
          onSelected: (value) {
            if (value != null) {
              setState(() {
                selectedValue = value;
                widget.onChanged(selectedValue);
              });
            }
          },
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppColors.white,
            constraints: BoxConstraints.tight(Size(341.w, 52.h)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.whiteSub, width: 1.w),
            ),
          ),
          menuStyle: MenuStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
          ),
          menuHeight: 200,
          dropdownMenuEntries:
              names
                  .map(((name) => DropdownMenuEntry(value: name, label: name)))
                  .toList(),
        ),
      ],
    );
  }
}
