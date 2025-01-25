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
    float r = random(1);
    if (r < 0.5) {
      this.particles.add(new Particle(this.origin.x, this.origin.y));
    } else {
      this.particles.add(new Confetti(this.origin.x, this.origin.y));
    }
  }

  void run() {
    for (int i = this.particles.size() - 1; i >= 0; i--) {
      Particle p = this.particles.get(i);
      p.run();
      if (p.isDead()) {
        this.particles.remove(i);
      }
    }
  }
}
