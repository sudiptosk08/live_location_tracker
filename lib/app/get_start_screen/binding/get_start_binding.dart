import 'package:get/get.dart';
import 'package:live_location_tracker/app/get_start_screen/controller/get_start_controller.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetStartedController());
  }
}
