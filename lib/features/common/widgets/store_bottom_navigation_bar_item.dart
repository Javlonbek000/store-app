import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreBottomNavigationBarItem extends StatelessWidget {
  const StoreBottomNavigationBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconWidth,
    required this.iconHeight,
    required this.callback,
    required this.iconColor,
    required this.titleColor,
  });

  final String title, icon;
  final double iconWidth, iconHeight;
  final VoidCallback callback;
  final Color iconColor, titleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: GestureDetector(
        onTap: callback,
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: iconWidth.w,
              height: iconHeight.h,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
