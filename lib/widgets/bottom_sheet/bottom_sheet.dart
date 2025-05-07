// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:slash_service_provider_v2/app/accept_booking/controller/accept_booking_controller.dart';
// import 'package:slash_service_provider_v2/utils/colors/app_colors.dart';
// import 'package:slash_service_provider_v2/utils/sizes/k_sizes.dart';
// import 'package:slash_service_provider_v2/utils/text_styles/k_text_styles.dart';

// class BottomSheet {
//   static void show({
//     required BuildContext context,
//     required List<PaymentMethod>
//         paymentMethodList, // Assuming PaymentMethod is a model
//     required int? selectedPaymentMethod,
//     required Function(int) onPaymentMethodChanged,
//     required Function() onContinuePressed,
//   }) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, setState) {
//             int? id;

//             return Wrap(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(KSizes.hGapLarge),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30.0),
//                       topRight: Radius.circular(30.0),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Select Servicemen',
//                               style: KTextStyles.bodyText1),
//                           IconButton(
//                               onPressed: () => Get.back(),
//                               icon: Icon(
//                                 Icons.close,
//                                 size: 26.sp,
//                               ))
//                         ],
//                       ),

//                       SizedBox(height: KSizes.hGapMedium),
//                       // Payment Method List
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ...List.generate(paymentMethodList.length, (index) {
//                             return Container(
//                               margin: const EdgeInsets.symmetric(vertical: 5),
//                               padding: EdgeInsets.all(KSizes.hGapSmall),
//                               decoration: BoxDecoration(
//                                   color: KColors.background,
//                                   borderRadius: BorderRadius.circular(9.r),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: KColors.grey.withOpacity(0.4),
//                                         blurRadius: 2,
//                                         spreadRadius: 1.9,
//                                         offset: const Offset(0.7, 0.3)),
//                                   ]),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     paymentMethodList[index].name,
//                                     style: KTextStyles.bodyText2,
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Radio(
//                                     fillColor: WidgetStatePropertyAll(
//                                         KColors.primary.withOpacity(0.9)),
//                                     value: paymentMethodList[index].id,
//                                     groupValue: selectedPaymentMethod,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         selectedPaymentMethod =
//                                             paymentMethodList[index].id;

//                                         id = index;
//                                       });
//                                       onPaymentMethodChanged(id!);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                         ],
//                       ),
//                       SizedBox(
//                         height: KSizes.hGapMedium,
//                       ),
//                       // Continue Button
//                       TextButton(
//                         style: TextButton.styleFrom(
//                             minimumSize: Size(KSizes.kScreenWidth, 35.h),
//                             padding: EdgeInsets.symmetric(
//                                 // horizontal: KSizes.
//                                 vertical: KSizes.vGapMedium),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(9.r),
//                             ),
//                             textStyle: KTextStyles.bodyText2.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                             backgroundColor: KColors.primary),
//                         onPressed: onContinuePressed,
//                         child: Text(
//                           "Continue",
//                           style: KTextStyles.bodyText3
//                               .copyWith(color: KColors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }
