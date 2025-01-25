// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

float angle = 0;
float angleVelocity = 0.05;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  float amplitude = 200;
  float x = amplitude * sin(angle);
  angle += angleVelocity;

  translate(width / 2, height / 2);

  stroke(0);
  strokeWeight(2);
  fill(127);
  line(0, 0, x, 0);
  circle(x, 0, 48);
}
