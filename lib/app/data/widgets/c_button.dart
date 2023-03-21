import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'xText.dart';

class CButton extends StatelessWidget {
  final String title;
  final onTap;
  final double? width;
  const CButton({super.key, required this.title, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: width ?? 320.w,
        alignment: Alignment.center,
        child: XText(
          text: title,
          color: Colors.white,
          size: 18.sp,
        ),
        decoration: BoxDecoration(
            color: Color(0xff06038D), borderRadius: BorderRadius.circular(6.r)),
      ),
    );
  }
}

class LButton extends StatelessWidget {
  final String title;
  final onTap;
  const LButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 70.h,
        width: 320.w,
        alignment: Alignment.center,
        child: XText(
          text: title,
          color: Colors.white,
          size: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
            color: Color(0xff046A38), borderRadius: BorderRadius.circular(6.r)),
      ),
    );
  }
}
