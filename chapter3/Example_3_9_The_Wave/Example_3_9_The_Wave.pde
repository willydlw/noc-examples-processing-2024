// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

float startAngle = 0;
float angleVelocity = 0.2;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  float angle = startAngle;
  startAngle += 0.02;

  for (int x = 0; x <= width; x += 24) {
    float y = map(sin(angle), -1, 1, 0, height);
    stroke(0);
    strokeWeight(2);
    fill(127, 127);
    circle(x, y, 48);
    angle += angleVelocity;
  }
}
