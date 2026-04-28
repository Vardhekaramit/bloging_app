import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double wp(double value) => (value / 375) * width;
  double hp(double value) => (value / 812) * height;

  double sp(double size) => (size / 375) * width;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;
}