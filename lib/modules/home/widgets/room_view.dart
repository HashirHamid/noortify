import 'package:flutter/material.dart';
import 'package:noortify/modules/home/widgets/room_card.dart';
import 'package:noortify/modules/search/widgets/device_card.dart';

class RoomView extends StatelessWidget {
  final String objectType;
  final List objectsList;
  const RoomView({
    super.key,
    required this.objectType,
    required this.objectsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GridView.builder(
        itemCount: objectsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (objectType == "room") {
            return RoomCard(room: objectsList[index]);
          } else {
            return DeviceCard(device: objectsList[index]);
          }
        },
      ),
    );
  }
}
