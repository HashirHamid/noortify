import 'package:flutter/material.dart';
import 'package:noortify/data/sample_data/sample_devices.dart';
import 'package:noortify/modules/search/model/security_device.dart';
import 'package:noortify/modules/search/widgets/device_card.dart';
import 'package:noortify/shared_widgets/button.dart';

class SearchScreen extends StatelessWidget {
  final List<SecurityDevice> devices = SampleDevices.data;

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${devices.length} new device(s)",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white.withValues(alpha: 0.6),
                ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: devices.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .925,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index < devices.length) {
                  return DeviceCard(device: devices[index]);
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 2.0,
                        color: Color.fromARGB(255, 57, 53, 53),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset("assets/images/wifi-logo.png"),
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            flex: 1,
                            child: Text(
                              textAlign: TextAlign.center,
                              "Not found device?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(
                                        255, 248, 248, 248),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 153, 54),
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            onPressed: () {},
                            child: Text("Select manually"),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Center(
            child: Button(
              text: "Add a device",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
