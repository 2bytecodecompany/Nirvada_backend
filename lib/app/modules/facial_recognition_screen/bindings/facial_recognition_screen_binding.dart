import 'package:get/get.dart';

import '../controllers/facial_recognition_screen_controller.dart';

class FacialRecognitionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FacialRecognitionScreenController>(
      () => FacialRecognitionScreenController(),
    );
  }
}
