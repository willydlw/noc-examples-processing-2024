// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  particles.add(new Particle(width / 2, 20));

  // Looping through backwards to delete
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle particle = particles.get(i);
    particle.run();
    if (particle.isDead()) {
      //remove the particle
      particles.remove(i);
    }
  }
}
