// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Stay Within Walls
// "Made-up" Steering behavior to stay within walls

Vehicle vehicle;

boolean debug = true;
int offset = 25;

void setup() {
  size(640, 360);
  vehicle = new Vehicle(width / 2, height / 2);
}

void draw() {
  background(255);

  if (debug) {
    stroke(0);
    noFill();
    rectMode(CENTER);
    rect(width / 2, height / 2, width - offset * 2, height - offset * 2);
  }

  // Call the appropriate steering behaviors for our agents
  vehicle.boundaries(offset);

  vehicle.update();
  vehicle.show();

}

void mousePressed() {
  debug = !debug;
}
