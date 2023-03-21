import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirvada_user/app/data/widgets/appNameText.dart';
import 'package:nirvada_user/app/data/widgets/c_button.dart';
import 'package:nirvada_user/app/modules/qr_screen/functions/qr_funtions.dart';
import 'package:nirvada_user/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../data/widgets/custom_textfield.dart';
import '../../../data/widgets/xText.dart';
import '../controllers/qr_screen_controller.dart';
import 'qr_scan_screen.dart';

class QrScreenView extends GetView<QrScreenController> {
  const QrScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 26.h,
            ),
            AppNameText(),
            XText(
              text: "Be a responsible citizen",
            ),
            SizedBox(
              height: 40.h,
            ),
            XText(
              text: "Scan this code at the center to cast your vote -",
              size: 12.sp,
            ),
            SizedBox(
              height: 16.h,
            ),
            QRCodeGenerator(QRFucntions.qrVoterID, 290.sp),
            // QrImage(
            //   data: "This is flutter",
            //   version: QrVersions.auto,
            //   size: 200.sp,
            //   gapless: true,
            //   foregroundColor: Colors.black,
            //   backgroundColor: Colors.white,
            //   errorCorrectionLevel: QrErrorCorrectLevel.Q,
            // ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 1,
                  color: Colors.black,
                )),
                SizedBox(
                  width: 8.w,
                ),
                XText(
                  text: "OR",
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                    child: Container(
                  height: 1.h,
                  color: Colors.black,
                )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            XText(
              text: "Login with your credentials -",
              size: 14.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.LOGIN_SCREEN);
                  // controller.encrypt("hello");
                },
                child: Container(
                  height: 50.h,
                  width: 260.w,
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
            )
          ]),
        ),
      ),
    );
  }
}
