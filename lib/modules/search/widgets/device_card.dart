import 'package:flutter/material.dart';
import 'package:noortify/modules/search/model/security_device.dart';

class DeviceCard extends StatelessWidget {
  final SecurityDevice device;
  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(24),
        splashColor: const Color.fromARGB(255, 121, 110, 110),
        highlightColor: const Color.fromARGB(255, 255, 153, 54),
        child: Ink(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 40, 36, 36),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: device.image),
              Expanded(
                flex: 2,
                child: Text(
                  device.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color.fromARGB(255, 248, 248, 248),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
