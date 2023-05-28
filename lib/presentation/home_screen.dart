import 'package:flutter/material.dart';
import 'package:mmouse/data/sensor_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SensorDataProvider>(context, listen: false).startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SensorDataProvider>(
              builder: (context, sensorData, _) {
                if (sensorData.sensorData != null) {
                  return Column(
                    children: [
                      Text('X: ${sensorData.sensorData!.x.toStringAsFixed(2)}'),
                      Text('Y: ${sensorData.sensorData!.y.toStringAsFixed(2)}'),
                      Text('Z: ${sensorData.sensorData!.z.toStringAsFixed(2)}'),
                      ElevatedButton(
                        onPressed: () => testConnection(context),
                        child: const Text("Test Connection"),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void testConnection(BuildContext context) async {
    const url = 'http://192.168.100.5:3001/test-connection';
    final response = await http.post(Uri.parse(url), body: 'Test message');

    if (response.statusCode == 200) {
      print('Test connection successful');
    } else {
      print('Test connection failed');
    }
  }
}
