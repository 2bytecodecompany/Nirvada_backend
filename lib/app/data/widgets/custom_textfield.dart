import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvada_user/app/data/widgets/xText.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final validator;
  final bool? isObsecure;

  final suffixIcon;
  final int maxLength;
  const CustomTextField(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.maxLength = 20,
      this.validator,
      this.isObsecure,
      this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: XText(
              text: widget.title,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(
          height: 4.h,
        ),
        SizedBox(
          // height: 54.h,
          width: 320.w,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            maxLength: widget.maxLength,
            obscureText: widget.isObsecure ?? false,
            cursorColor: Color(0xff1b1b1b),
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              hintText: widget.hintText,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff1b1b1b), width: 2.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
              ),
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xB31B1B1B)),
              fillColor: Color(0x4DD9D9D9),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
