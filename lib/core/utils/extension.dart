import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  SizedBox get hp => SizedBox(height: toDouble());
  SizedBox get wp => SizedBox(width: toDouble());
}