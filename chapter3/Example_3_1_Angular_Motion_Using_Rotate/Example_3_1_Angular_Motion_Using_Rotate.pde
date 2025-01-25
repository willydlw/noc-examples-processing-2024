// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Position
float angle = 0;
// Velocity
float angleVelocity = 0;
//{!1} Acceleration
float angleAcceleration = 0.0001;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  translate(width / 2, height / 2);
  rotate(angle);

  stroke(0);
  strokeWeight(2);
  fill(127);
  
  line(-60, 0, 60, 0);
  circle(60, 0, 16);
  circle(-60, 0, 16);

  // Angular equivalent of velocity.add(acceleration);
  angleVelocity += angleAcceleration;
  // Angular equivalent of position.add(velocity);
  angle += angleVelocity;
}
