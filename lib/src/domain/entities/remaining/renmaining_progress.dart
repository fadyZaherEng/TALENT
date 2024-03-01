import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';

class RemainingProgress {
  final double lineHeight;
  final Color backgroundColor;
  final String remainingHours;
  final double percent;
  final Color progressColor;
  final bool isPlusTime;

  RemainingProgress({
    this.lineHeight = 28.0,
    this.backgroundColor = ColorSchemes.border,
    this.progressColor = ColorSchemes.statusSuccess,
    this.remainingHours = '',
    required this.isPlusTime,
    required this.percent,
  });
}
