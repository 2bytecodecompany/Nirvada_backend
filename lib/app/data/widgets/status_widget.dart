import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'xText.dart';

class DetailsWidget extends StatelessWidget {
  final String title;
  final String data;
  const DetailsWidget({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        XText(
          text: title,
          size: 14.sp,
        ),
        XText(
          text: data,
          size: 14.sp,
          isLight: true,
        )
      ],
    );
  }
}
