// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// The Emitter manages all the particles.
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
    // Applying a force as a PVector
    for (Particle particle : this.particles) {
      particle.applyForce(force);
    }
  }

  void applyRepeller(Repeller repeller) {
    // Calculating a force for each Particle based on a Repeller
    for (Particle particle : this.particles) {
      PVector force = repeller.repel(particle);
      particle.applyForce(force);
    }
  }

  void run() {
    for (int i = this.particles.size() - 1; i >= 0; i--) {
      Particle particle = this.particles.get(i);
      particle.run();
      if (particle.isDead()) {
        this.particles.remove(i);
      }
    }
  }
}
