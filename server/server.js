const express = require('express');
const robot = require("robotjs");

const app = express();
const port = 3001;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.post('/test-connection', (req, res) => {
  console.log('Received message:', req.body);

  // Extract the x and y values from the request body
  const { x, y } = req.body;
  
  // get current mouse pos
  var mouse = robot.getMousePos();

  // Set the mouse cursor position
  robot.moveMouse(mouse.x +x, mouse.y + y);

  res.send('Message received successfully');
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
