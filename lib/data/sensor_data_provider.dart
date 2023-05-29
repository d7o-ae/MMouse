import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:http/http.dart' as http;

class SensorData {
  double x;
  double y;

  SensorData({
    required this.x,
    required this.y,
  });
}

class SensorDataProvider with ChangeNotifier {
  SensorData? sensorData;

  void startListening() {
    magnetometerEvents.listen((event) {
      sensorData = SensorData(
        x: event.x,
        y: event.y,
      );
      notifyListeners();
      testConnection();
    });
  }

  void testConnection() async {
    const url = 'http://192.168.100.5:3001/test-connection';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'x': sensorData!.x, // Access x value from sensorData
        'y': sensorData!.y, // Access y value from sensorData
      }),
    );

    if (response.statusCode == 200) {
      print('Test connection successful');
    } else {
      print('Test connection failed');
    }
  }
}
