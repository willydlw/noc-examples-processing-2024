// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Emitter emitter;

void setup() {
  size(640,360);
  emitter = new Emitter(width / 2, 50);
}

void draw() {
  background(255);
  emitter.addParticle();
  emitter.run();
}
