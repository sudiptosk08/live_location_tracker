import 'package:get/get.dart';
import 'package:live_location_tracker/app/user_a/controller/user_a_controller.dart';

class UserABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserAController());
  }
}
