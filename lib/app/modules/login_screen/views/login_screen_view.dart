import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nirvada_user/app/data/widgets/appNameText.dart';

import '../../../data/widgets/custom_textfield.dart';
import '../../../data/widgets/xText.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<LoginScreenController>(builder: (controller) {
          if (!controller.isLoading) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 34.h,
                      ),
                      AppNameText(),
                      XText(
                        text: "Be a responsible citizen",
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      XText(
                        text: "LOGIN",
                        size: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      XText(
                        text: "Enter lgoin credentials",
                        isLight: true,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomTextField(
                        title: "Aadhaar Number",
                        hintText: "Enter the aadhaar number",
                        controller: controller.authID,
                        maxLength: 12,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter a valid aadhaar number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomTextField(
                        title: "Password",
                        hintText: "Enter the password from SMS",
                        controller: controller.password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter a valid password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.onlogin();
                          }
                        },
                        child: Container(
                          height: 50.h,
                          width: 320.w,
                          alignment: Alignment.center,
                          child: XText(
                            text: "LOGIN",
                            color: Colors.white,
                            size: 18.sp,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xff06038D),
                              borderRadius: BorderRadius.circular(6.r)),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          XText(
                            text: "Need help?",
                            color: Color(0xff06038D),
                          ),
                          XText(
                            text: 'Contact us at 18x.',
                          )
                        ],
                      )
                    ]),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
