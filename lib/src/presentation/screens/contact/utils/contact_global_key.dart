import 'package:flutter/material.dart';

class ContactGlobalKey {
  final GlobalKey contactType;
  final GlobalKey contactNo;

  ContactGlobalKey({
    required this.contactType,
    required this.contactNo,
  });
}
