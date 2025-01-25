// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Smoke Particle System

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles

class Emitter {
  PVector origin;
  ArrayList<Particle> particles;
  
  Emitter(float x, float y) {
    this.origin = new PVector(x, y); // Initialize the arraylist
    this.particles = new ArrayList<Particle>(); // Store the origin point
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

  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector force) {
    // Enhanced loop!!!
    for (Particle particle : this.particles) {
      particle.applyForce(force);
    }
  }

  void addParticle() {
    this.particles.add(new Particle(this.origin.x, this.origin.y));
  }
}
