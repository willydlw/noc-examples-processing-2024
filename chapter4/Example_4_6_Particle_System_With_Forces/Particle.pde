// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

// A simple Particle class

class Particle {
  PVector position, velocity, acceleration;
  float lifespan, mass;
  
  Particle(float x, float y) {
    this.position =  new PVector(x, y);
    this.velocity = new PVector(random(-1, 1), random(-2, 0));
    this.acceleration = new PVector(0, 0);
    this.lifespan = 255.0;
    this.mass = 1; // Let's do something better here!
  }

  void run() {
    this.update();
    this.show();
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(this.mass);
    this.acceleration.add(f);
  }

  // Method to update position
  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
    this.lifespan -= 2.0;
  }

  // Method to display
  void show() {
    stroke(0, this.lifespan);
    strokeWeight(2);
    fill(127, this.lifespan);
    circle(this.position.x, this.position.y, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    return this.lifespan < 0.0;
  }
}
