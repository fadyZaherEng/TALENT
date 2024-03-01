import 'package:flutter/material.dart';

import 'package:talent_link/src/core/resources/image_paths.dart';

class Vacation {
  final int id;
  final String title;
  final Color statusColor;
  final String status;
  final String date;
  final String iconPath;

  Vacation({
    required this.id,
    required this.title,
    required this.statusColor,
    required this.status,
    required this.date,
    this.iconPath = ImagePaths.sparkles,
  });
}
