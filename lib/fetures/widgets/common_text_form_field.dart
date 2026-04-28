import 'package:bloging_app/core/constants/app_colors.dart';
import 'package:bloging_app/utils/responsive.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final double? height;

  const CommonTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.wp(width ?? 300),
      height: context.hp(height ?? 60),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(fontSize: context.sp(14)),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.wp(12),
            vertical: context.hp(14),
          ),

          helperText: ' ', // 🔥 prevents height change

          errorStyle: TextStyle(fontSize: context.sp(10), height: 0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.wp(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.wp(8)),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.wp(8)),
            borderSide: BorderSide(color: AppColors.borderStrong(context)),
          ),
        ),
      ),
    );
  }
}
