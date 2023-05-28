const express = require('express');
const robot = require("robotjs");

const app = express();
const port = 3001;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.post('/test-connection', (req, res) => {
  console.log('Received message:', req.body);
  res.send('Message received successfully');

  // Set the mouse cursor position
  const { x, y } = req.body;
  robot.moveMouse(x, y);
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
