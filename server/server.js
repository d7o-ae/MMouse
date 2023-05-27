const app = require('express')();
const http = require('http').createServer(app);
const io = require('socket.io')(http);

const port = 3001;

io.on('connection', (socket) => {
  console.log('A client connected');

  // Handle the 'test_message' event
  socket.on('test_message', (message) => {
    console.log('Received test message:', message);
    // You can perform any actions here when the test message is received from the mobile app
    // For example, you can send a success message back to the mobile app
    socket.emit('test_success', 'Test message received successfully');
  });

  // Handle disconnection
  socket.on('disconnect', () => {
    console.log('A client disconnected');
  });
});

http.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
