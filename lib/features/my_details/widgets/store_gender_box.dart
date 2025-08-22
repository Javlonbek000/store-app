import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class StoreGenderBox extends StatefulWidget {
  const StoreGenderBox({
    super.key,
    this.initialSelection,
    required this.callback,
    required this.items,
  });

  final String? initialSelection;
  final Function(String? value) callback;
  final List<String> items;

  @override
  State<StoreGenderBox> createState() => _StoreGenderBoxState();
}

class _StoreGenderBoxState extends State<StoreGenderBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h),
        DropdownMenu<String>(
          width: double.infinity,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            constraints: BoxConstraints.tight(Size(double.infinity, 52)),
          ),
          initialSelection: widget.initialSelection,
          hintText: "Gender",
          onSelected: widget.callback,
          dropdownMenuEntries:
              widget.items.map((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
        ),
      ],
    );
  }
}
