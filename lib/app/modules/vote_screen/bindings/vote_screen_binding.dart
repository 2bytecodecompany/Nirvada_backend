import 'package:get/get.dart';

import '../controllers/vote_screen_controller.dart';

class VoteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoteScreenController>(
      () => VoteScreenController(),
    );
  }
}
