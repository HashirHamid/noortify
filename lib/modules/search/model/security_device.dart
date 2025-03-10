import 'package:flutter/material.dart';
import 'package:noortify/modules/search/model/access_log.dart';

class SecurityDevice {
  final String name;
  final int? pin;
  final List<AccessLog>? accessLogs;
  final Image image;

  SecurityDevice({
    required this.name,
    required this.image,
    this.pin,
    this.accessLogs,
  });
}
