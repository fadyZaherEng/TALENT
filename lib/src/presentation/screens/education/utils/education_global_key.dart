import 'package:flutter/material.dart';

class EducationGlobalKey {
  final GlobalKey qualificationType;
  final GlobalKey qualificationPlaceName;
  final GlobalKey country;
  final GlobalKey issueDate;
  final GlobalKey expiryDate;

  EducationGlobalKey({
    required this.qualificationType,
    required this.qualificationPlaceName,
    required this.country,
    required this.issueDate,
    required this.expiryDate,
  });
}
