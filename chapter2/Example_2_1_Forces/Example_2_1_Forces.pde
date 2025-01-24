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

  PVector gravity = new PVector(0, 0.1);
  mover.applyForce(gravity);

  if (mousePressed) {
    PVector wind = new PVector(0.1, 0);
    mover.applyForce(wind);
  }

  mover.update();
  mover.display();
  mover.checkEdges();
}
