// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover mover;

void setup() {
  size(640, 360);
  mover = new Mover(width / 2, 30, 5);
  println("Click mouse to apply wind force.");
}

void draw() {
  background(255);

  PVector gravity = new PVector(0, 1);
  //{!1} I should scale by mass to be more accurate, but this example only has one circle
  mover.applyForce(gravity);

  if (mousePressed) {
    PVector wind = new PVector(0.5, 0);
    mover.applyForce(wind);
  }

  if (mover.contactEdge()) {
    //{!5 .bold}
    float c = 0.1;
    PVector friction = mover.velocity.copy();
    friction.mult(-1);
    friction.setMag(c);

    //{!1 .bold} Apply the friction force vector to the object.
    mover.applyForce(friction);
  }

  mover.bounceEdges();
  mover.update();
  mover.show();
}
