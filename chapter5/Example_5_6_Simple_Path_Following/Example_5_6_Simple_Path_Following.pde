// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Path Following
// Path is a just a straight line in this example
// Via Reynolds: // http://www.red3d.com/cwr/steer/PathFollow.html

// Using this variable to decide whether to draw all the stuff
boolean debug = true;

// A path object (series of connected points)
Path path;

// Two vehicles
Vehicle vehicle1, vehicle2;

void setup() {
  println("Hit space bar to toggle debugging lines.");

  size(640, 360);
  path = new Path();

  // Each vehicle has different maxspeed and maxforce for demo purposes
  vehicle1 = new Vehicle(0, height / 2, 2, 0.02);
  vehicle2 = new Vehicle(0, height / 2, 3, 0.05);
}

void draw() {
  background(255);
  // Display the path
  path.show();
  // The boids follow the path
  vehicle1.follow(path);
  vehicle2.follow(path);
  // Call the generic run method (update, borders, display, etc.)
  vehicle1.run();
  vehicle2.run();

  // Check if it gets to the end of the path since it's not a loop
  vehicle1.borders(path);
  vehicle2.borders(path);
}

void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}
