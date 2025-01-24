// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {
  float mass,radius;
  PVector position,velocity,acceleration;
  
  Mover(float x, float y, float m) {
    this.mass = m;
    this.radius = m * 8;
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
  }
  
  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  void update() {
    // Velocity changes according to acceleration
    this.velocity.add(this.acceleration);
    // position changes by velocity
    this.position.add(this.velocity);
    // We must clear acceleration each frame
    this.acceleration.mult(0);
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    fill(127, 127);
    circle(this.position.x, this.position.y, this.radius * 2);
  }
}
