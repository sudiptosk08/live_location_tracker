import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_location_tracker/utils/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onTap,
    required this.btnText,
    this.height,
    this.iconData,
    this.iconSize,
    super.key,
    this.radius,
    this.btnColor,
    this.textColor = KColors.white,
    this.isFill = false,
    this.padding = 0,
  });

  final VoidCallback onTap;
  final String btnText;
  final double? iconSize;
  final double? radius;
  final Color? btnColor;
  final Color textColor;
  final double? height;
  final IconData? iconData;
  final bool isFill;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding),
        height: height ?? 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 15.r),
          border: !isFill
              ? null
              : Border.all(
                  color: KColors.primary,
                ),
          color: btnColor,
          // gradient: btnColor == null && !isFill
          //     ? LinearGradient(
          //         colors:,
          //       )
          //     : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null)
                Row(
                  children: [
                    Icon(
                      iconData,
                      size: iconSize,
                      color: KColors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              Text(
                btnText,
                style: TextStyle(
                  color: textColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
