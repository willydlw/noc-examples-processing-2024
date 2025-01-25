// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Emitter {
  PVector origin;
  ArrayList<Particle> particles;
  
  Emitter(float x, float y) {
    this.origin = new PVector(x, y);
    this.particles = new ArrayList<Particle>();
  }

  void addParticle() {
    this.particles.add(new Particle(this.origin.x, this.origin.y));
  }

  void applyForce(PVector force) {
    // Using a for of loop to apply the force to all particles
    for (Particle particle : this.particles) {
      particle.applyForce(force);
    }
  }

  void run() {
    // Can't use the enhanced loop because checking for particles to delete.
    for (int i = this.particles.size() - 1; i >= 0; i--) {
      Particle particle = this.particles.get(i);
      particle.run();
      if (particle.isDead()) {
        this.particles.remove(i);
      }
    }
  }
}
