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
    this.velocity = new PVector(random(-1, 1), random(-2, 0));
    this.acceleration = new PVector(0, 0);
    this.lifespan = 255.0;
  }

  void run() {
    PVector gravity = new PVector(0, 0.05);
    this.applyForce(gravity);
    this.update();
    this.show();
  }

  void applyForce(PVector force) {
    this.acceleration.add(force);
  }

  // Method to update position
  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.lifespan -= 2;
    this.acceleration.mult(0);
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
    return (this.lifespan < 0.0);
  }
}
