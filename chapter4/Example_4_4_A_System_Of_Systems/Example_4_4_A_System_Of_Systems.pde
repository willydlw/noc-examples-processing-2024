// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Particles are generated each cycle through draw(),
// fall with gravity and fade out over time
// A ParticleSystem object manages a variable size
// list of particles.

// an array of ParticleSystems
ArrayList<Emitter> emitters = new ArrayList<Emitter>();

void setup() {
  size(640, 360);
  println("click to add particle systems");
}

void draw() {
  background(255);
  for (Emitter emitter : emitters) {
    emitter.run();
    emitter.addParticle();
  }
}

void mousePressed() {
  emitters.add(new Emitter(mouseX, mouseY));
}
