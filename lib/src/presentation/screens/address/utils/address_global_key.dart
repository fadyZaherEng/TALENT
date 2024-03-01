import 'package:flutter/material.dart';

class AddressGlobalKey {
  final GlobalKey name;
  final GlobalKey area;
  final GlobalKey street;
  final GlobalKey building;
  final GlobalKey floor;
  final GlobalKey flat;

  AddressGlobalKey({
    required this.name,
    required this.area,
    required this.street,
    required this.building,
    required this.floor,
    required this.flat,
  });
}
