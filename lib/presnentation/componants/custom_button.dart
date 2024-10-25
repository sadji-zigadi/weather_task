import 'package:flutter/material.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Function? onPressed;
  final String text;

  CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Color(0xFFEC6E4C),
          foregroundColor: Colors.white,
        ),
        child: CustomText(
          text: text,
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
