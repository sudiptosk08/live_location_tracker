import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_location_tracker/app/get_start_screen/controller/get_start_controller.dart';
import 'package:live_location_tracker/routes/routes.dart';
import 'package:live_location_tracker/utils/colors/app_colors.dart';
import 'package:live_location_tracker/utils/sizes/k_sizes.dart';

import '../../../utils/text_styles/k_text_styles.dart';

class GetStartedPage extends GetView<GetStartedController> {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KColors.white,
        body:  SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  SizedBox(
                    width: KSizes.kScreenWidth,
                    height: 250.h,
                    child: Row(
                      children: List.generate(
                        40, // Number of stripes
                        (index) => Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? KColors.blueGreyLight
                                  : KColors.greyLight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 100),
                        child: Container(
                          height: KSizes.kScreenHeight * 0.50,
                          decoration: BoxDecoration(
                            color: KColors.transparent,
                          ),
                          child: Icon(Icons.location_on_outlined,
                              size: 100.h, color: KColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 320.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    color: KColors.background),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: KSizes.hGapExtraLarge,
                      vertical: KSizes.vGapMedium),
                  child: Column(
                    children: [
                      Divider(
                        endIndent: 120.w,
                        indent: 120.w,
                        thickness: 2,
                        color: KColors.primary,
                      ),
                      SizedBox(
                        height: KSizes.vGapSmall,
                      ),
                      Text(
                        'Select User Type',
                        style: KTextStyles.bodyText2.copyWith(
                            color: KColors.black, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: KSizes.vGapSmall,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.userAPageView);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(320.w, 35.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              side: BorderSide(
                                color: KColors.primary,
                                width: 2,
                              ),
                            ),
                            backgroundColor: KColors.white,
                            foregroundColor: KColors.white,
                          ),
                          child: Text(
                            "USER A",
                            style: KTextStyles.bodyText1
                                .copyWith(color: KColors.black),
                          )),
                      SizedBox(
                        height: KSizes.vGapMedium,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.userBPageView);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(320.w, 35.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              side: BorderSide(
                                color: KColors.primary,
                                width: 2,
                              ),
                            ),
                            backgroundColor: KColors.white,
                            foregroundColor: KColors.white,
                          ),
                          child: Text(
                            "USER B",
                            style: KTextStyles.bodyText1
                                .copyWith(color: KColors.black),
                          )),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
  }
}
