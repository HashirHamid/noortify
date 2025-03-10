import 'package:flutter/material.dart';
import 'package:noortify/modules/home/models/room.dart';

class SampleRooms {
  static final List<Room> data = [
    Room(
      deviceCount: 3,
      name: "Living Room",
      image: AssetImage("assets/icons/living-room.png"),
      isOn: true,
    ),
    Room(
      deviceCount: 3,
      name: "Bathroom",
      image: AssetImage("assets/icons/bathroom.png"),
      isOn: false,
    ),
    Room(
      deviceCount: 2,
      name: "Dining Room",
      image: AssetImage("assets/icons/dining-room.png"),
      isOn: false,
    ),
    Room(
      deviceCount: 4,
      name: "BedRoom",
      image: AssetImage("assets/icons/bedroom.png"),
      isOn: false,
    )
  ];
}
