import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  // Define any other necessary properties and variables
  String PCIP;
  late IO.Socket socket;

  // Constructor
  SocketManager(this.PCIP) {
    // Initialize your socket connection in the constructor
    connectToSocket();
  }

  // Method to establish socket connection
  void connectToSocket() {
    // Establish a socket connection with the PC
    socket = IO.io('http://$PCIP', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // Implement any necessary event listeners or handlers for socket events
    // For example:
    socket.on('connect', (_) {
      print('Socket connected');
    });
  }

  // Implement other methods for sending mouse movement data or handling socket events
  void testConnection() {
    // Implement the logic to test the connection to the PC here
    // For example, you can send a test message to the PC
    socket.emit('test_message', 'Testing connection');
  }
}
