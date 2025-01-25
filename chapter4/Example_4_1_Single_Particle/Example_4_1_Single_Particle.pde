// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Particle particle;

void setup() {
  size(640,360);
  particle = new Particle(width / 2, 10);
}

void draw() {
  background(255);
  // Operating the single Particle
  particle.update();
  particle.show();

  // Applying a gravity force
  PVector gravity = new PVector(0, 0.1);
  particle.applyForce(gravity);

  // Checking the particle's state and making a new particle
  if (particle.isDead()) {
    particle = new Particle(width / 2, 20);
    println("Particle dead!");
  }
}
