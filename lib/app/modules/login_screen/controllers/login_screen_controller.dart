import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nirvada_user/app/modules/login_screen/functions/login_screen_function.dart';

import '../../../routes/app_pages.dart';

class LoginScreenController extends GetxController {
  final TextEditingController authID = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  void onlogin() async {
    isLoading = true;
    update();
    await LoginFuntion.loginUser(reversedAuthId(authID.text), password.text);

    Get.toNamed(Routes.HOME, arguments: authID.text);
  }

  String reversedAuthId(String id) {
    String newId = id.substring(10);
    return newId.split('').reversed.join();
  }
}
