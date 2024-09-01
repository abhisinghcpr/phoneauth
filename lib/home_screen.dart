import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:intl/intl.dart';

class BluetoothApp extends StatefulWidget {
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devicesList = [];
  BluetoothDevice? connectedDevice;
  BluetoothState bluetoothState = BluetoothState.unknown;
  bool isScanning = false;
  String currentTime = '';

  @override
  void initState() {
    super.initState();

    flutterBlue.state.listen((state) {
      setState(() {
        bluetoothState = state;
      });
      if (state == BluetoothState.on) {
        startScan();
      }
    });


    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());
      });
    });
  }

  void startScan() {
    if (!isScanning) {
      setState(() {
        isScanning = true;
      });
      flutterBlue.startScan(timeout: Duration(seconds: 5)).then((_) {
        setState(() {
          isScanning = false;
        });
      });

      flutterBlue.scanResults.listen((scanResults) {
        for (ScanResult result in scanResults) {
          final device = result.device;

          if (!devicesList.contains(device) && device.name.isNotEmpty) {
            setState(() {
              devicesList.add(device);
            });
          }
        }
      });
    } else {
      print("Scan already in progress");
    }
  }

  void connectToDevice(BluetoothDevice device) async {
    try {
      var connectedDevices = await flutterBlue.connectedDevices;
      if (connectedDevices.contains(device)) {
        print("Device is already connected.");
        return;
      }

      await device.connect(timeout: Duration(seconds: 10));
      setState(() {
        connectedDevice = device;
        devicesList.remove(device);
        devicesList.insert(0, device);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Connected Successfully to ${device.name}")),
      );
    } catch (e) {
      print("Error connecting to device: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to connect to ${device.name}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bluetooth Devices'),
            Text(currentTime),
          ],
        ),
      ),
      body: bluetoothState == BluetoothState.on
          ? RefreshIndicator(
        onRefresh: () async {
          setState(() {
            devicesList.clear();
          });
          startScan();
        },
        child: devicesList.isEmpty
            ? Center(
          child: Text("Scanning for devices..."),
        )
            : ListView.builder(
          itemCount: devicesList.length,
          itemBuilder: (context, index) {
            final device = devicesList[index];
            bool isConnected = device == connectedDevice;
            return Card(
              child: ListTile(
                title: Text(device.name),
                subtitle: Text(device.id.toString()),
                trailing: isConnected
                    ? Text('Connected',
                    style: TextStyle(color: Colors.green))
                    : null,
                onTap: () => connectToDevice(device),
              ),
            );
          },
        ),
      )
          : Center(
        child: Text(
          'Bluetooth is off. Please turn on.',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
    );
  }
}
