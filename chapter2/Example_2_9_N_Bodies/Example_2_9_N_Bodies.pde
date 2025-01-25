// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Body[] bodies = new Body[10];

float G = 1;

void setup() {
  size(640, 360);
  for (int i = 0; i < 10; i++) {
    bodies[i] = new Body(random(width), random(height), random(0.1, 2));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < bodies.length; i++) {
    for (int j = 0; j < bodies.length; j++) {
      if (i != j) {
        PVector force = bodies[j].attract(bodies[i]);
        bodies[i].applyForce(force);
      }
    }

    bodies[i].update();
    bodies[i].show();
  }
}
