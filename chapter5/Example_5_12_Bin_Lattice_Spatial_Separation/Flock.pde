// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flock object
// Does very little, simply manages the array of all the boids

class Flock {
  
  ArrayList<Boid> boids;

  Flock() {
    // An array for all the boids
    this.boids = new ArrayList<Boid>(); // Initialize the array
  }

  void run() {
    for (Boid boid : this.boids) {
      boid.run();
    }
  }

  void addBoid(Boid boid) {
    this.boids.add(boid);
  }
}
