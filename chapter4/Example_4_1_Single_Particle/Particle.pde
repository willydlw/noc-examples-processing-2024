// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

// A simple Particle class

class Particle {
  PVector position, velocity, acceleration;
  float lifespan;

  Particle(float x, float y) {
    this.position =  new PVector(x, y);
    // For demonstration purposes the Particle has a random velocity.
    this.velocity = new PVector(random(-1, 1), random(-2, 0));
    this.acceleration = new PVector(0, 0);
    this.lifespan = 255.0;
  }

  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.lifespan -= 2.0;
    this.acceleration.mult(0);
  }


  void show() {
    stroke(0, this.lifespan);
    fill(0, this.lifespan);
    circle(this.position.x, this.position.y, 8);
  }

  // Keeping the same physics model as with previous chapters
  void applyForce(PVector force) {
    this.acceleration.add(force);
  }

  // Is the Particle alive or dead?
  boolean isDead() {
    return (this.lifespan < 0);
  }
}
