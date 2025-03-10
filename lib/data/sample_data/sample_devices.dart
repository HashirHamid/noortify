import 'package:flutter/material.dart';
import 'package:noortify/modules/search/model/security_device.dart';

class SampleDevices {
  static final List<SecurityDevice> data = [
    SecurityDevice(
      name: "Tuya Front Door",
      image: Image.asset("assets/images/tuya-door.png"),
    ),
    SecurityDevice(
      name: "Back Door",
      image: Image.asset("assets/images/back-door.png"),
    ),
    SecurityDevice(
      name: "Main Door",
      image: Image.asset("assets/images/main-door.png"),
    )
  ];
}
