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

  void run() {
    // Looping through backwards to delete
    for (int i = this.particles.size() - 1; i >= 0; i--) {
      this.particles.get(i).run();
      if (this.particles.get(i).isDead()) {
        // Remove the particle
        this.particles.remove(i);
      }
    }

    // Run every particle
    // ES6 for..of loop
    // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of
    // https://www.youtube.com/watch?v=Y8sMnRQYr3c
    // for (let particle of this.particles) {
    //   particle.run();
    // }

    // Filter removes any elements of the array that do not pass the test
    // I am also using ES6 arrow snytax
    // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
    // https://www.youtube.com/watch?v=mrYMzpbFz18
    // this.particles = this.particles.filter(particle => !particle.isDead());

    // Without ES6 arrow code would look like:
    // this.particles = this.particles.filter(function(particle) {
    //   return !particle.isDead();
    // });
  }
}
