import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordFeild extends StatelessWidget {
  final String hint;
  Icon icon;
  final TextEditingController? Controller;

  CustomPasswordFeild({
    required this.hint,
    this.Controller,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 306.w,
      height: 50.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
          controller: Controller,
          textAlign: TextAlign.start,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            icon: icon,
            hintStyle: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: Colors.black,
            ),
          )),
    );
  }
}
