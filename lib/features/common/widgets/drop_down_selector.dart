import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownSelector<T> extends StatefulWidget {
  const DropdownSelector({
    super.key,
    required this.menuEntries,
    required this.callback,
    required this.validator,
    this.initialSelection,
    required this.width,
    this.minWidth = 250,
    this.maxWidth = 250,
  });

  final Function(T?) callback;
  final String? Function(T?) validator;
  final List<DropdownMenuEntry<T>> menuEntries;
  final T? initialSelection;
  final double width, minWidth, maxWidth;

  @override
  State<DropdownSelector<T>> createState() => _DropdownSelectorState<T>();
}

class _DropdownSelectorState<T> extends State<DropdownSelector<T>>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: widget.validator,
      builder: (field) {
        return DropdownMenu<T>(
          width: widget.width,
          enableSearch: true,
          enableFilter: true,
          initialSelection: widget.initialSelection,
          onSelected: (value) {
            widget.callback(value);
            field.didChange(value);
          },
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          dropdownMenuEntries: widget.menuEntries,
        );
      },
    );
  }
}
