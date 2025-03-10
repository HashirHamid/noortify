import 'package:flutter/material.dart';

class Room {
  final int deviceCount;
  final String name;
  final AssetImage image;
  final bool isOn;

  Room({
    required this.deviceCount,
    required this.name,
    required this.image,
    required this.isOn,
  });
}