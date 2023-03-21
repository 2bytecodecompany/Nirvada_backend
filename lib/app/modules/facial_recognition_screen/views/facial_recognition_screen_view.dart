import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirvada_user/app/data/widgets/appNameText.dart';
import 'package:nirvada_user/app/data/widgets/c_button.dart';
import 'package:nirvada_user/app/data/widgets/xText.dart';
import '../controllers/facial_recognition_screen_controller.dart';

class FacialRecognitionScreenView
    extends GetView<FacialRecognitionScreenController> {
  FacialRecognitionScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(title: const Text('Facial Recognition')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
=======
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.0.w),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
>>>>>>> 49618948bd65b3676a8ee89b63d920edf47795d2
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
                  text: "Facial Recognition",
                  size: 24,
                  fontWeight: FontWeight.w600,
                ),
                XText(
                  text: "We need to ensure that it's you",
                  isLight: true,
                ),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  height: 120.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => controller.showImagePickerDialog(1),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: GetBuilder<FacialRecognitionScreenController>(
                              builder: (controller) {
                            return controller.image1 == null
                                ? const Icon(Icons.add, size: 50)
                                : Image.file(controller.image1!,
                                    fit: BoxFit.cover);
                          }),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.showImagePickerDialog(2),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: GetBuilder<FacialRecognitionScreenController>(
                              builder: (controller) {
                            return controller.image2 == null
                                ? const Icon(Icons.add, size: 50)
                                : Image.file(controller.image2!,
                                    fit: BoxFit.cover);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                GetBuilder<FacialRecognitionScreenController>(
                    builder: (controller) {
                  if (controller.matchPercentage.isNotEmpty) {
                    return XText(
                      size: 18.sp,
                      fontWeight: FontWeight.w600,
                      isCenter: true,
                        text:
                            "You have been verified with\n${controller.matchPercentage}% accuracy");
                  } else {
                    return SizedBox();
                  }
                }),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical:18.h),
                      child: CButton(
                          title: "Verify",
                          width: 250.w,
                          onTap: () {
                            controller.onCompare();
                          }),
                    );
                  }
                }),
              ],
            ),
          )),
    );
  }
}