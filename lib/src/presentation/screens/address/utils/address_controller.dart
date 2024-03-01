import 'package:flutter/material.dart';

class AddressController {
  final TextEditingController name;
  final TextEditingController area;
  final TextEditingController street;
  final TextEditingController building;
  final TextEditingController floor;
  final TextEditingController flat;
  final TextEditingController addressDetails;
  final TextEditingController remarks;

  AddressController({
    required this.name,
    required this.area,
    required this.street,
    required this.building,
    required this.floor,
    required this.flat,
    required this.addressDetails,
    required this.remarks,
  });
}
