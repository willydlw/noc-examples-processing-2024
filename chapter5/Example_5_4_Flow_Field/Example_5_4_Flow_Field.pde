// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flow Field Following
// Via Reynolds: http://www.red3d.com/cwr/steer/FlowFollow.html

// Using this variable to decide whether to draw all the stuff
boolean debug = true;

// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
Vehicle []vehicles;

void setup() {
  println(
    "Hit space bar to toggle debugging lines.<br>Click the mouse to generate a new flow field."
  );

  size(640, 360);
  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(20);
  vehicles = new Vehicle[120];
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
  for (int i = 0; i < 120; i++) {
    vehicles[i] = 
      new Vehicle(random(width), random(height), random(2, 5), random(0.1, 0.5));
  }
}

void draw() {
  background(255);
  // Display the flowfield in "debug" mode
  if (debug) flowfield.show();
  // Tell all the vehicles to follow the flow field
  for (int i = 0; i < vehicles.length; i++) {
    vehicles[i].follow(flowfield);
    vehicles[i].run();
  }
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

// Make a new flowfield
void mousePressed() {
  flowfield.init();
}
