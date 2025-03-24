import 'package:flutter/material.dart';
import 'package:noortify/tuya_service.dart';

class SmartLockScreen extends StatefulWidget {
  const SmartLockScreen({super.key});

  @override
  _SmartLockScreenState createState() => _SmartLockScreenState();
}

class _SmartLockScreenState extends State<SmartLockScreen> {
  final TuyaService tuyaService = TuyaService();
  List<dynamic> devices = [];
  String? selectedDevice;

  @override
  void initState() {
    super.initState();
    authenticate();
  }

  Future<void> authenticate() async {
    await tuyaService.authenticate();
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    devices = await tuyaService.getDevices();
    if (devices.isNotEmpty) {
      setState(() {
        selectedDevice = devices.first["id"];
      });
    }
  }

  void toggleLock(bool open) {
    if (selectedDevice != null) {
      tuyaService.controlLock(selectedDevice!, open);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smart Lock")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedDevice,
              items: devices.map((device) {
                return DropdownMenuItem<String>(
                  value: device["id"],
                  child: Text(device["name"]),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDevice = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => toggleLock(true),
              child: Text("Open Lock"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => toggleLock(false),
              child: Text("Close Lock"),
            ),
          ],
        ),
      ),
    );
  }
}
