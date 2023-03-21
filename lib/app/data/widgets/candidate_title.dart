import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nirvada_user/app/data/widgets/xText.dart';
import 'package:nirvada_user/app/models/CandidateModel.dart';

import '../../routes/app_pages.dart';

class CandidateTile extends StatelessWidget {
  final CandidateModel candidate;
  final String authId;
  const CandidateTile(
      {super.key, required this.candidate, required this.authId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.VOTE_SCREEN, arguments: {
              'candidate': candidate.toJson(),
              'authId': authId,
            });
          },
          child: Container(
            width: 345.w,
            height: 80.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(
                              base64Decode(candidate.candidateImage))),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      XText(
                        size: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        text: candidate.candidateName,
                      ),
                      XText(
                        size: 14,
                        text: candidate.candidatePartyName,
                        color: Color(0xB31B1B1B),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  // Image.network(
                  //   candidate.partySign,
                  //   height: 52.sp,
                  // ),
                ]),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, -2),
                  )
                ]),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
