import 'package:flutter/material.dart';
import 'package:mmouse/data/sensor_data_provider.dart';
import 'package:mmouse/presentation/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SensorDataProvider()),
      ],
      child: MaterialApp(
        title: 'MMouse',
        home: HomeScreen(),
      ),
    );
  }
}
