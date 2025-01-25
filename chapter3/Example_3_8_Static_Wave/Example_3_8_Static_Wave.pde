// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

float angle = 0;
float angleVelocity = 0.2;
float amplitude = 100;

void setup() {
  size(640, 360);
  background(255);

  stroke(0);
  strokeWeight(2);
  fill(127, 127);

  for (int x = 0; x <= width; x += 24) {
    // 1) Calculate the y position according to amplitude and sine of the angle.
    float y = amplitude * sin(angle);
    // 2) Draw a circle at the (x,y) position.
    circle(x, y + height / 2, 48);
    // 3) Increment the angle according to angular velocity.
    angle += angleVelocity;
  }
}
