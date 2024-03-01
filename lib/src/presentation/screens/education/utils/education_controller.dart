import 'package:flutter/material.dart';

class EducationController {
  final TextEditingController qualificationType;
  final TextEditingController qualificationPlaceName;
  final TextEditingController country;
  final TextEditingController remarks;

  EducationController({
    required this.qualificationType,
    required this.qualificationPlaceName,
    required this.country,
    required this.remarks,
  });
}
