// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// One ParticleSystem
Emitter emitter;

//{!1} One repeller
Repeller repeller;

void setup() {
  size(640 , 360);
  emitter = new Emitter(width / 2, 60);
  repeller = new Repeller(width / 2, 250);
}

void draw() {
  background(255);
  emitter.addParticle();
  // We’re applying a universal gravity.
  PVector gravity = new PVector(0, 0.1);
  emitter.applyForce(gravity);
  // Applying the repeller
  emitter.applyRepeller(repeller);
  emitter.run();

  repeller.show();
}
