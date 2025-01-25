// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-5: Vector magnitude

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width / 2, height / 2);
  mouse.sub(center);

  //The magnitude (i.e. length) of a vector can be accessed via the mag() function.  Here it is used as the width of a rectangle drawn at the top of the window.
  float m = mouse.mag();
  fill(0);
  rect(10, 10, m, 10);

  translate(width / 2, height / 2);
  line(0, 0, mouse.x, mouse.y);
}
