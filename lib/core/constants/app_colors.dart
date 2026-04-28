import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Helper — auto picks light or dark ─────────────────────
  static Color background(BuildContext context) =>
      _isDark(context) ? darkBackground : lightBackground;

  static Color surface(BuildContext context) =>
      _isDark(context) ? darkSurface : lightSurface;

  static Color page(BuildContext context) =>
      _isDark(context) ? darkPage : lightPage;

  static Color textPrimary(BuildContext context) =>
      _isDark(context) ? darkTextPrimary : lightTextPrimary;

  static Color textSecondary(BuildContext context) =>
      _isDark(context) ? darkTextSecondary : lightTextSecondary;

  static Color textHint(BuildContext context) =>
      _isDark(context) ? darkTextHint : lightTextHint;

  static Color borderSubtle(BuildContext context) =>
      _isDark(context) ? darkBorderSubtle : lightBorderSubtle;

  static Color borderMedium(BuildContext context) =>
      _isDark(context) ? darkBorderMedium : lightBorderMedium;

  static Color borderStrong(BuildContext context) =>
      _isDark(context) ? darkBorderStrong : lightBorderStrong;

  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  // Brand / Accent Blue
  static const blue50  = Color(0xFFE6F1FB);
  static const blue100 = Color(0xFFB5D4F4);
  static const blue400 = Color(0xFF378ADD);
  static const blue600 = Color(0xFF185FA5);
  static const blue800 = Color(0xFF0C447C);
  static const blue900 = Color(0xFF042C53);

  // Purple (avatars)
  static const purple100 = Color(0xFFCED0F6);
  static const purple800 = Color(0xFF3C3489);

  // Teal (hero gradient)
  static const teal100 = Color(0xFF9FE1CB);
  static const teal400 = Color(0xFF5DCAA5);

  // Semantic
  static const error   = Color(0xFFE24B4A);
  static const warning = Color(0xFFEF9F27);
  static const success = Color(0xFF639922);

  // Hero gradient stops
  static const gradientStart = Color(0xFF9FE1CB);
  static const gradientMid   = Color(0xFFB5D4F4);
  static const gradientEnd   = Color(0xFFCED0F6);

  // Light palette
  static const lightBackground        = Color(0xFFFFFFFF);
  static const lightSurface           = Color(0xFFF5F5F0);
  static const lightPage              = Color(0xFFEFEFEA);
  static const lightTextPrimary       = Color(0xFF1A1A1A);
  static const lightTextSecondary     = Color(0xFF6B6B6B);
  static const lightTextHint          = Color(0xFFA8A8A8);
  static const lightBorderSubtle      = Color(0xFFE0E0D8);
  static const lightBorderMedium      = Color(0xFFC8C8C0);
  static const lightBorderStrong      = Color(0xFFA8A8A0);

  // Dark palette
  static const darkBackground         = Color(0xFF1E1E1E);
  static const darkSurface            = Color(0xFF2A2A2A);
  static const darkPage               = Color(0xFF141414);
  static const darkTextPrimary        = Color(0xFFF0F0F0);
  static const darkTextSecondary      = Color(0xFFA0A0A0);
  static const darkTextHint           = Color(0xFF5A5A5A);
  static const darkBorderSubtle       = Color(0xFF333333);
  static const darkBorderMedium       = Color(0xFF444444);
  static const darkBorderStrong       = Color(0xFF555555);
}

