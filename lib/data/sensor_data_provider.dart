import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorData {
  double x;
  double y;
  double z;

  SensorData({required this.x, required this.y, required this.z});
}

class SensorDataProvider with ChangeNotifier {
  SensorData? sensorData;

  void startListening() {
    accelerometerEvents.listen((event) {
      sensorData = SensorData(x: event.x, y: event.y, z: event.z);
      notifyListeners();
    });
  }
}
