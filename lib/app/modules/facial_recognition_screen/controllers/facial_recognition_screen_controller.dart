import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nirvada_user/app/modules/facial_recognition_screen/functions/functions.dart';

import '../../../data/widgets/xText.dart';

class FacialRecognitionScreenController extends GetxController {
  File? image1;
  File? image2;
  RxBool isLoading = false.obs;
  String matchPercentage = "";

  Future<void> _pickImage(ImageSource source, int boxNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      if (boxNumber == 1) {
        image1 = File(pickedFile.path);
      } else if (boxNumber == 2) {
        image2 = File(pickedFile.path);
      }
      update();
    }
  }

  Future<void> showImagePickerDialog(int boxNumber) async {
    Get.dialog(
      AlertDialog(
        title: XText(text:'Add Photo', size: 18.sp, fontWeight: FontWeight.bold,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                _pickImage(ImageSource.camera, boxNumber);
              },
              child: XText(text: 'Take a photo', size: 14.sp,),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Get.back();
                _pickImage(ImageSource.gallery, boxNumber);
              },
              child:  XText(text: 'Choose from gallery', size: 14.sp,),
            ),
          ],
        ),
      ),
    );
  }

  void onCompare() async {
    if (image1 != null && image2 != null) {
      isLoading.value = true;

      List<int> imageBytes1 = await image1!.readAsBytes();
      String image1Encoded = base64Encode(imageBytes1);
      print(image1Encoded);

      List<int> imageBytes2 = await image2!.readAsBytes();
      String image2Encoded = base64Encode(imageBytes2);
      print(image2Encoded);
      matchPercentage = await FacialRecognisitionFunction.compareImages(
            image1Encoded,
            image2Encoded,
          ) ??
          "Something Went Wrong";

      update();

      isLoading.value = false;
    }
  }
}
