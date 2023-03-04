import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/const.dart';

class TextInputField extends StatelessWidget {
  TextInputField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.labelText,
      this.isObscure = false});

  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(fontSize: 25.sp),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: borderColor)),
      ),
      obscureText: isObscure,
    );
  }
}
