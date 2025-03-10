import 'package:flutter/material.dart';
import 'package:noortify/data/sample_data/sample_devices.dart';
import 'package:noortify/data/sample_data/sample_rooms.dart';
import 'package:noortify/modules/home/models/room.dart';
import 'package:noortify/modules/home/widgets/room_view.dart';
import 'package:noortify/modules/search/model/security_device.dart';
import 'package:noortify/shared_widgets/button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Room> rooms = SampleRooms.data;
  final List<SecurityDevice> bathDevices = SampleDevices.data;
  final List<SecurityDevice> bedDevices = SampleDevices.data;
  final List<SecurityDevice> diningDevices = SampleDevices.data;
  final List<SecurityDevice> livingDevices = SampleDevices.data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/homepage-img.png",
            height: 175,
          ),
          Expanded(
            child: DefaultTabController(
              length: rooms.length + 1, // Number of tabs
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true, // Allows smooth scrolling if needed
                    labelColor: Colors.white, // Active tab text color
                    unselectedLabelColor:
                        Colors.grey, // Inactive tab text color
                    indicatorColor: Colors.white, // Underline indicator color
                    indicatorWeight: 3, // Thickness of underline
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(text: "All Rooms"),
                      for (final room in rooms) Tab(text: room.name),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        RoomView(
                          objectType: "room",
                          objectsList: rooms,
                        ),
                        RoomView(
                          objectType: "device",
                          objectsList: livingDevices,
                        ),
                        RoomView(
                          objectType: "device",
                          objectsList: bathDevices,
                        ),
                        RoomView(
                          objectType: "device",
                          objectsList: diningDevices,
                        ),
                        RoomView(
                          objectType: "device",
                          objectsList: bedDevices,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Button(
              text: "Add a device",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
