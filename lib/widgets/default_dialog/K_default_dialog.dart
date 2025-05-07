import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_location_tracker/utils/colors/app_colors.dart';
import 'package:live_location_tracker/utils/sizes/k_sizes.dart';
import 'package:live_location_tracker/utils/text_styles/k_text_styles.dart';

class KPopupDialog {
  static Future<dynamic> dialog({
    required String title,
    required String subTitle,
    required VoidCallback onTapYes,
    required VoidCallback onTapNo,
    String yesText = "YES",
    String noText = "NO",
  }) async {
    return Get.dialog(
      AlertDialog(
        surfaceTintColor: KColors.white,
        backgroundColor: KColors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: KSizes.hGapLarge),
        titlePadding: EdgeInsets.symmetric(
          horizontal: KSizes.hGapLarge,
        ).copyWith(
          top: KSizes.vGapLarge,
          bottom: KSizes.vGapSmall,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: KSizes.hGapLarge),
        actionsPadding: EdgeInsets.symmetric(
            horizontal: KSizes.hGapLarge, vertical: KSizes.vGapLarge),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: KTextStyles.headline1,
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                    color: KColors.black,
                  ))
            ],
          ),
        ),
        content: SizedBox(
          height: 190.h,
          child: Column(
            children: [
              Container(
                width: KSizes.kScreenWidth,
                padding: EdgeInsets.all(KSizes.hGapLarge),
                decoration: BoxDecoration(
                    color: KColors.background,
                    borderRadius: BorderRadius.circular(9.r)),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: KTextStyles.bodyText1.copyWith(
                      fontWeight: FontWeight.w200, color: KColors.textGrey),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 35.h),
                      backgroundColor: KColors.white,
                      shape: RoundedRectangleBorder(
                        side:
                            const BorderSide(color: KColors.primary, width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.r),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Do it later",
                      style: KTextStyles.bodyText1.copyWith(
                        color: KColors.primary,
                      ),
                    )),
              ),
              SizedBox(
                width: KSizes.hGapLarge,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 35.h),
                      backgroundColor: KColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.r),
                        ),
                      ),
                    ),
                    onPressed: onTapYes,
                    child: Text(
                      "Accept",
                      style: KTextStyles.bodyText1.copyWith(
                        color: KColors.white,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
