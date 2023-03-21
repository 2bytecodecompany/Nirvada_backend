import 'dart:async';

import 'package:get/get.dart';
import 'package:nirvada_user/app/models/CandidateModel.dart';
import 'package:nirvada_user/app/routes/app_pages.dart';

import '../../../data/get storage/get_storage.dart';
import '../functions/home_screen_function.dart';

class HomeController extends GetxController {
  int start = 180;
  String? authid = Get.arguments;
  late Timer timer;
  bool isLoading = true;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        timer.cancel();
        Get.offAllNamed(Routes.QR_SCREEN);
      } else {
        start--;
        update(['0']);
        // update();
      }
    });
  }

  List<CandidateModel> candidateData = [];
  void onTap() async {
    candidateData = (await HomeFuntion.candidateDetails());
    if (authid != null) {
      Storage.saveValue('authId', authid);
    } else {
      authid = Storage.getValue('authId');
    }
    isLoading = false;
    startTimer();
    update(['id']);
  }

  @override
  void onInit() {
    super.onInit();
    onTap();
  }
}
