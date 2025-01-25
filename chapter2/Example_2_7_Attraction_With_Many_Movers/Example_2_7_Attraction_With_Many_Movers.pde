// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
Mover[] movers = new Mover[10];

Attractor attractor;

void setup() {
  size(640, 360);
  for (int i = 0; i < 10; i++) {
    movers[i] = new Mover(random(width), random(height), random(0.5, 3));
  }
  attractor = new Attractor();
}

void draw() {
  background(255);

  attractor.show();

  for (int i = 0; i < movers.length; i++) {
    PVector force = attractor.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    movers[i].show();
  }
}

void mouseMoved() {
  attractor.handleHover(mouseX, mouseY);
}

void mousePressed() {
  attractor.handlePress(mouseX, mouseY);
}

void mouseDragged() {
  attractor.handleHover(mouseX, mouseY);
  attractor.handleDrag(mouseX, mouseY);
}

void mouseReleased() {
  attractor.stopDragging();
}
