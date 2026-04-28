import 'package:bloging_app/core/constants/app_colors.dart';
import 'package:bloging_app/utils/responsive.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final double? radius;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  final double? elevation;
  final BorderSide? borderSide;

  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
    this.radius,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.elevation,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? context.hp(50),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          backgroundColor: isLoading
              ? Colors.grey
              : (backgroundColor ?? AppColors.blue400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
            side: borderSide ?? BorderSide.none,
          ),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            height: context.hp(20),
            width: context.hp(20),
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon!,
                SizedBox(width: context.wp(8)),
              ],
              Text(
                text,
                style: TextStyle(
                  fontSize: context.sp(16),
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}