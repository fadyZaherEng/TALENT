import 'package:flutter/material.dart';

class AttachmentController {
  final TextEditingController attachmentType;
  final TextEditingController documentNo;
  final TextEditingController remarks;

  AttachmentController({
    required this.attachmentType,
    required this.documentNo,
    required this.remarks,
  });
}
