import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nirvada_user/app/data/widgets/candidate_title.dart';
import '../../../data/widgets/xText.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  final authId = Get.arguments;
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        // tag: "0",
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
                                    text:
                                        "Time Left : ${controller.start.toString()} ",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1b1b1b),
                                    )),
                              ]));
                        })),
                Align(
                  alignment: Alignment.centerLeft,
                  child: XText(
                    text: "Select your candidate -",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 48.h),
                GetBuilder<HomeController>(
                  id: "id",
                  builder: (controller) {
                    if (!controller.isLoading) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: controller.candidateData.length,
                          itemBuilder: (context, index) {
                            final candidate = controller.candidateData[index];
                            return CandidateTile(
                              candidate: candidate,
                              authId: controller.authid!,
                            );
                          },
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
