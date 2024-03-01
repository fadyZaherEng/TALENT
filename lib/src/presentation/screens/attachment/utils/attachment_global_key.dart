import 'package:flutter/material.dart';

class AttachmentGlobalKey {
  final GlobalKey attachmentType;
  final GlobalKey documentNo;
  final GlobalKey issueDate;
  final GlobalKey file;

  AttachmentGlobalKey({
    required this.attachmentType,
    required this.documentNo,
    required this.issueDate,
    required this.file,
  });
}
