import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/constants.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight,
    this.color = AppColors.darkColor,
  });

  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat().copyWith(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
