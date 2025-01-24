// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover mover;

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);
  mover.show();
  mover.update();
  mover.checkEdges();
}
