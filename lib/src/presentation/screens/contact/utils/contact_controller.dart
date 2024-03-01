import 'package:flutter/material.dart';

class ContactController {
  final TextEditingController contactType;
  final TextEditingController contactNo;
  final TextEditingController remark;

  ContactController({
    required this.contactType,
    required this.contactNo,
    required this.remark,
  });
}
