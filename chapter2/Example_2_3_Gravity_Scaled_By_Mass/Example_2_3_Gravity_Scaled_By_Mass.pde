// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover moverA;
Mover moverB;

void setup() {
  size(640, 360);
  // A large Mover on the left side of the window
  moverA = new Mover(200, 30, 10);
  // A smaller Mover on the right side of the window
  moverB = new Mover(440, 30, 2);
}

void draw() {
  background(255);

  PVector gravity = new PVector(0, 0.1);

  PVector gravityA = PVector.mult(gravity, moverA.mass);
  moverA.applyForce(gravityA);

  PVector gravityB = PVector.mult(gravity, moverB.mass);
  moverB.applyForce(gravityB);

  if (mousePressed) {
    PVector wind = new PVector(0.1, 0);
    moverA.applyForce(wind);
    moverB.applyForce(wind);
  }

  moverA.update();
  moverA.display();
  moverA.checkEdges();

  moverB.update();
  moverB.display();
  moverB.checkEdges();
}
