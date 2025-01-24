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

  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    fill(127, 127);
    circle(this.position.x, this.position.y, this.radius * 2);
  }

  boolean contactEdge() {
    // The mover is touching the edge when it's within one pixel
    return (this.position.y > height - this.radius - 1);
  }

  void bounceEdges() {
    // A new variable to simulate an inelastic collision
    // 10% of the velocity's x or y component is lost
    float bounce = -0.9;
    if (this.position.x > width - this.radius) {
      this.position.x = width - this.radius;
      this.velocity.x *= bounce;
    } else if (this.position.x < this.radius) {
      this.position.x = this.radius;
      this.velocity.x *= bounce;
    }
    if (this.position.y > height - this.radius) {
      this.position.y = height - this.radius;
      this.velocity.y *= bounce;
    }
  }

}
