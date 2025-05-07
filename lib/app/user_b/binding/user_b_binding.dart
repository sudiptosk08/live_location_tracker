import 'package:get/get.dart';
import 'package:live_location_tracker/app/user_b/controller/user_b_controller.dart';

class UserBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserBController());
  }
}
