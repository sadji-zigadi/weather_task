import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/constants.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.darkColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkColor,
          ),
        ),
      ),
      controller: controller,
    );
  }
}
