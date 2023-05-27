import 'package:flutter/material.dart';
import '../data/socket_manager.dart';

class HomeScreen extends StatelessWidget {
  final SocketManager socketManager = SocketManager('192.168.100.3:3001');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MMouse App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: testConnection,
          child: Text('Test Connection'),
        ),
      ),
    );
  }

  void testConnection() {
    print("clicked");
    socketManager.testConnection();
  }
}
