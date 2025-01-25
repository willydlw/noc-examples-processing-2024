// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of normalizing a vector.
// Normalizing a vector sets its length to 1.

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  // A vector that points to the mouse position
  PVector mouse = new PVector(mouseX, mouseY);
  // A vector that points to the center of the window
  PVector center = new PVector(width / 2, height / 2);
  // Subtract center from mouse which results in a vector that points from center to mouse
  mouse.sub(center);

  translate(width / 2, height / 2);
  stroke(200);
  strokeWeight(2);
  line(0, 0, mouse.x, mouse.y);

  // Normalize the vector
  mouse.normalize();

  // Multiply its length by 50
  mouse.mult(50);

  // Draw the resulting vector
  stroke(0);
  strokeWeight(8);
  line(0, 0, mouse.x, mouse.y);
}
