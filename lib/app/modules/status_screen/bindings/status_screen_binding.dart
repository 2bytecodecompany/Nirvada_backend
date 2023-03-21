import 'package:get/get.dart';

import '../controllers/status_screen_controller.dart';

class StatusScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusScreenController>(
      () => StatusScreenController(),
    );
  }
}
