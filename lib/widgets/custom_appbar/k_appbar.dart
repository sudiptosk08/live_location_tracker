import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_location_tracker/utils/assets/images/k_images.dart';
import 'package:live_location_tracker/utils/colors/app_colors.dart';
import 'package:live_location_tracker/utils/sizes/k_sizes.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? backgroundColor;
  final bool? centerTitle;
  final TextStyle? titleTextStyle;
  final double topBarHeight;
  final double leadingWidths;

  const KAppBar({
    super.key,
    this.leading,
    this.leadingWidths = 65,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.centerTitle,
    this.titleTextStyle,
    this.topBarHeight = 70,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: topBarHeight,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      bottom: bottom,
      elevation: elevation,
      titleTextStyle: titleTextStyle,
      backgroundColor: backgroundColor,
      flexibleSpace: flexibleSpace,
      automaticallyImplyLeading: false,
      leading: leading ?? _buildLeadingWidget(context),
      leadingWidth: leadingWidths.w,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(topBarHeight);

  Widget? _buildLeadingWidget(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);

    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    final bool hasDrawer = scaffold.hasDrawer;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    if (hasDrawer) {
      return IconButton(
        icon: const Icon(Icons.menu_rounded),
        onPressed: Scaffold.of(context).openDrawer,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    } else {
      if (canPop) {
        if (useCloseButton) {
          return IconButton(
              color: Theme.of(context).colorScheme.onSurface,
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.of(context).maybePop());
        } else {
          return Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  visualDensity:
                      const VisualDensity(horizontal: -0.3, vertical: 0.2),
                  minimumSize: Size(19.w, 44.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: KSizes.hGapLarge - 2.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  backgroundColor: KColors.grey.withOpacity(0.2),
                  elevation: 0, // Disable the elevation splash effect
                  shadowColor: Colors.transparent,
                ),
                child: Image.asset(
                  KImages.arrowback,
                  width: 24,
                ),
              ),
            ],
          );
        }
      }
    }
    return null;
  }
}
