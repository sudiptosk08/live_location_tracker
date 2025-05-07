import 'package:get/get.dart';
import 'package:live_location_tracker/app/get_start_screen/binding/get_start_binding.dart';
import 'package:live_location_tracker/app/get_start_screen/view/get_start_page.dart';
import 'package:live_location_tracker/app/user_a/binding/user_a_binding.dart';
import 'package:live_location_tracker/app/user_a/view/user_a_page_view.dart';
import 'package:live_location_tracker/app/user_b/binding/user_b_binding.dart';
import 'package:live_location_tracker/app/user_b/view/user_b_page_view.dart';

class Routes {
  static const getStartedPage = '/getStartedPage';

  static const userAPageView = '/userAPageView';
  static const userBPageView = '/userBPageView';

  static var routeList = [
    GetPage(
      name: getStartedPage,
      page: () => const GetStartedPage(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: userAPageView,
      page: () => UserAPageView(),
      binding: UserABinding(),
    ),
    GetPage(
      name: userBPageView,
      page: () => UserBPageView(),
      binding: UserBBinding(),
    ),
  ];
}
