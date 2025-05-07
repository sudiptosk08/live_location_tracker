import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_location_tracker/utils/colors/app_colors.dart';
import 'package:live_location_tracker/utils/sizes/k_sizes.dart';
import 'package:live_location_tracker/utils/text_styles/k_text_styles.dart';

class KWidgets {
  static void defaultDialog(
      {required BuildContext context,
      required Widget child,
      String title = '',
      TextStyle? titleStyle,
      TextAlign titleAlign = TextAlign.center,
      Color titleBgColor = KColors.primary,
      double insetPadding = 10}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(KSizes.hGapLarge),
          backgroundColor: KColors.white,
          surfaceTintColor: KColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          title: title == ""
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    title,
                    textAlign: titleAlign,
                    style: const TextStyle(
                      color: KColors.white,
                    ),
                  ),
                ),
          titleTextStyle: titleStyle ?? KTextStyles.bodyText1,
          titlePadding: EdgeInsets.zero,
          content: SizedBox(
            width: KSizes.kScreenWidth,
            child: Wrap(
              children: [child],
            ),
          ),
        );
      },
    );
  }

  static void bottomSheet({
    required BuildContext context,
    required List<Widget> children,
    ShapeBorder? shape,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(
          children: children,
        );
      },
    );
  }
}
