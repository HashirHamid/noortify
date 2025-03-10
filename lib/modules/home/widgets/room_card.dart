import 'package:flutter/material.dart';
import 'package:noortify/modules/home/models/room.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(24),
        splashColor: const Color.fromARGB(255, 42, 60, 79),
        highlightColor: const Color.fromARGB(255, 20, 126, 223),
        child: Ink(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 11, 23, 35),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ink(
                  height: 42.5,
                  width: 42.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image(
                    height: 20,
                    image: room.image,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 1,
                  child: Text(
                    room.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: const Color.fromARGB(255, 248, 248, 248),
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${room.deviceCount} device(s)",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: const Color.fromARGB(255, 248, 248, 248)
                              .withValues(alpha: 0.7),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Switch(
                    activeColor: Colors.white,
                    activeTrackColor: const Color.fromARGB(255, 20, 126, 223),
                    value: room.isOn,
                    onChanged: (bool value) {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
