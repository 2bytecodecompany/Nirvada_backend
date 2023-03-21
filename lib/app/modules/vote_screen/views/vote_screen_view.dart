import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirvada_user/app/data/widgets/c_button.dart';
import 'package:nirvada_user/app/models/CandidateModel.dart';
import 'package:nirvada_user/app/routes/app_pages.dart';
import '../../../data/widgets/xText.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/vote_screen_controller.dart';

class VoteScreenView extends GetView<VoteScreenController> {
  final CandidateModel candidate =
      CandidateModel.fromJson(Get.arguments['candidate']);
  final String authId = Get.arguments['authId'];

  VoteScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      child: GetBuilder<HomeController>(
                          id: "0",
                          builder: (controller) {
                            return RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1b1b1b),
                                    ),
                                    children: [
                                  TextSpan(
                                      text: "Time Left : ",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff1b1b1b),
                                      )),
                                  TextSpan(
                                    text: homeController.start.toString(),
                                  )
                                ]));
                          })),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: XText(
                      text: "Vote here -",
                      size: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  Container(
                    height: 140.h,
                    width: 140.h,
                    // child: Image.asset("assets/images/image5.png"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                          image: MemoryImage(
                              base64Decode(candidate.candidateImage))),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  XText(
                    text: candidate.candidateName,
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  XText(
                    text: candidate.candidatePartyName,
                    size: 14.sp,
                    isLight: true,
                  ),
                  SizedBox(height: 38.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      XText(
                        text: candidate.candidatePartyName,
                        size: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Icon(Icons.arrow_forward),
                      Container(
                        height: 100.h,
                        width: 100.h,
                        // child: Image.asset("assets/images/image4.png")
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: MemoryImage(
                                  base64Decode(candidate.candidatePartySign))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  LButton(
                      title: "Vote",
                      onTap: () {
                        controller.showDialog(
                            candidate.candidateId,
                            candidate.candidateName,
                            candidate.candidatePartyName);
                      }),
                  SizedBox(
                    height: 18.h,
                  ),
                  CButton(
                    title: "Go back to login",
                    onTap: () {
                      Get.offAllNamed(Routes.HOME);
                    },
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  XText(
                    isCenter: true,
                    text: '''Instruction - 
Click on the vote (green) to cast your vote or click on 
go back (blue) to select another candidate.''',
                    size: 10.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
