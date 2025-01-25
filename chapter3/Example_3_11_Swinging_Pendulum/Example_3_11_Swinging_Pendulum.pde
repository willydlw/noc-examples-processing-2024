// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pendulum

// A simple pendulum simulation
// Given a pendulum with an angle theta (0 being the pendulum at rest) and a radius r
// we can use sine to calculate the angular component of the gravitational force.

// Gravity Force = Mass * Gravitational Constant;
// Pendulum Force = Gravity Force * sine(theta)
// Angular Acceleration = Pendulum Force / Mass = gravitational acceleration * sine(theta);

// Note this is an ideal world scenario with no tension in the
// pendulum arm, a more realistic formula might be:
// Angular Acceleration = (g / R) * sine(theta)

// For a more substantial explanation, visit:
// http://www.myphysicslab.com/pendulum1.html
Pendulum pendulum;

void setup() {
  size(640, 360);
  // Make a new Pendulum with an origin position and armlength
  pendulum = new Pendulum(width / 2, 30, 175);
}

void draw() {
  background(255);
  pendulum.update();
  pendulum.show();

  pendulum.drag(); // for user interaction
}

void mousePressed() {
  pendulum.clicked(mouseX, mouseY);
}

void mouseReleased() {
  pendulum.stopDragging();
}
