import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_location_tracker/utils/colors/app_colors.dart';
import 'package:live_location_tracker/utils/text_styles/k_text_styles.dart';

class KTheme {
  static AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    surfaceTintColor: KColors.grey,
    backgroundColor: KColors.white,
    titleTextStyle: TextStyle(
      fontSize: 16.sp,
    ),
    iconTheme: IconThemeData(
      size: 20.sp,
      color: KColors.textGrey,
    ),
  );

  static const BottomAppBarTheme bottomAppBarTheme = BottomAppBarTheme(
    color: KColors.white,
    surfaceTintColor: KColors.white,
  );

  static const BottomSheetThemeData bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: KColors.background,
    surfaceTintColor: KColors.white,
    shape: RoundedRectangleBorder(),
  );

  static ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: KColors.primary,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.r),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: KColors.primary,
      primary: KColors.primary,
    ),
  );

  static CardTheme cardTheme = CardTheme(
    color: KColors.white,
    surfaceTintColor: KColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.r),
    ),
  );

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: KColors.primary,
    surfaceTint: KColors.white,
    primary: KColors.primary,
    // ignore: deprecated_member_use
    background: KColors.background,
  );

  static DividerThemeData dividerThemeData = DividerThemeData(
    space: 5.h,
  );

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: KColors.primary,
      foregroundColor: KColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.r))),
      elevation: 0,
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontFamily: fontFamily,
      ),
    ),
  );

  static String? fontFamily = GoogleFonts.kanit().fontFamily;
  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: KTextStyles.bodyText2,
      padding: EdgeInsets.all(8.w),
    ),
  );
  static IconThemeData iconThemeData = IconThemeData(
    size: 20.sp,
  );
  static IconButtonThemeData iconButtonThemeData = IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: KColors.primary,
      iconSize: 20.sp,
    ),
  );

  static ListTileThemeData listTileThemeData = ListTileThemeData(
    iconColor: KColors.primary,
    titleTextStyle: KTextStyles.bodyText2.copyWith(
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.r),
    ),
    subtitleTextStyle: KTextStyles.subtitle1,
  );
}
