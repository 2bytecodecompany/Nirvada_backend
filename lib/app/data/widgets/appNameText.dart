import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget AppNameText() {
  return RichText(
    text: TextSpan(
      style: TextStyle(
          fontSize: 24.sp, fontFamily: "Poppins", fontWeight: FontWeight.w600),
      children: [
        TextSpan(
          text: 'Nri',
          style: TextStyle(color: Color(0xffFF671F)),
        ),
        TextSpan(
          text: 'v',
          style: TextStyle(color: Color(0xff06038D)),
        ),
        TextSpan(
          text: 'āda',
          style: TextStyle(color: Color(0xff046A38)),
        ),
      ],
    ),
  );
}
