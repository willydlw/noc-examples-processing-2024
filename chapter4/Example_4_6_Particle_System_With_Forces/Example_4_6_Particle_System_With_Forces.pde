// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Emitter emitter;

void setup() {
  size(640, 360);
  background(255);
  emitter = new Emitter(width / 2, 50);
}

void draw() {
  // Semi-transparent background
  noStroke();
  fill(255,30);
  rect(0,0,width,height);

  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  emitter.applyForce(gravity);

  emitter.addParticle();
  emitter.run();
}
