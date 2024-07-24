import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMainButton extends StatelessWidget {
  final String title;
  double height;
  double width;
  double fontsize;
  final VoidCallback onpressed;
  Color color;
  CustomMainButton(
      {super.key,
      required this.title,
      required this.width,
      required this.height,
      required this.fontsize,
      required this.onpressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: fontsize,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
