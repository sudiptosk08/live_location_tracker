import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_location_tracker/utils/colors/app_colors.dart';
import 'package:live_location_tracker/utils/sizes/k_sizes.dart';
import 'package:live_location_tracker/utils/text_styles/k_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.height,
    super.key,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.borderRadius,
    this.readOnly = false,
    this.maxLines,
    this.filled = false,
    this.fillColor = KColors.grey,
    this.focusedBorder,
    this.enabledBorder,
    this.cursorColor,
    this.suffixIcon,
    this.keyboardType,
    this.maxLength,
    this.isDismissKeyboardOutsideTap = true,
    this.controller,
    this.onTap,
    this.onChanged,
    this.inputFormatters,
    this.prefix,
    this.obscureText = false,
    this.borderColor = KColors.grey,
    this.title,
    this.titleStyle,
  });

  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final Color fillColor;
  final double? height;
  final TextStyle? hintStyle;
  final String? hintText;
  final int? maxLines;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool filled;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool isDismissKeyboardOutsideTap;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool obscureText;
  final Color borderColor;
  final String? title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Column(
            children: [
              Text(
                title!,
                style: titleStyle ?? KTextStyles.label1,
              ),
              SizedBox(
                height: KSizes.vGapLarge / 2,
              ),
            ],
          ),
        TextFormField(
          textAlignVertical: TextAlignVertical.top,
          textAlign: TextAlign.start,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          obscureText: obscureText,
          onTap: onTap,
          controller: controller,
          onTapOutside: isDismissKeyboardOutsideTap
              ? (event) => FocusScope.of(context).unfocus()
              : null,
          readOnly: readOnly,
          cursorColor: cursorColor,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          keyboardType: keyboardType,
          style: KTextStyles.bodyText3,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefix,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 5.h,
                ),
            filled: filled,
            fillColor: fillColor,
            hintText: hintText,
            floatingLabelStyle: KTextStyles.bodyText2,
            hintStyle: hintStyle ??
                KTextStyles.bodyText2.copyWith(color: KColors.grey),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: KColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 5.r,
                  ),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: borderColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? 5.r,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
