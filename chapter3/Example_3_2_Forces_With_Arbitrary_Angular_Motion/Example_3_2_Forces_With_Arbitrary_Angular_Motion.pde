// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[20];
Attractor attractor;

void setup() {
  size(640, 360);

  for (int i = 0; i < 20; i++) {
    movers[i] = new Mover(random(width), random(height), random(0.1, 2));
  }
  attractor = new Attractor();
}

void draw() {
  background(255);

  attractor.display();

  for (int i = 0; i < movers.length; i++) {
    PVector force = attractor.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    movers[i].show();
  }
}
