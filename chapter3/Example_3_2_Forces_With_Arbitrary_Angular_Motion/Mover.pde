// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {
  float mass, radius;
  PVector position, velocity, acceleration;
  float angle, angleVelocity, angleAcceleration;
  
  Mover(float x, float y, float mass) {
    this.mass = mass;
    this.radius = this.mass * 8;
    this.position = new PVector(x, y);
    this.angle = 0;
    this.angleVelocity = 0;
    this.angleAcceleration = 0;
    this.velocity = new PVector(random(-1, 1), random(-1, 1));
    this.acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.angleAcceleration = this.acceleration.x / 10.0;
    this.angleVelocity += this.angleAcceleration;
    this.angleVelocity = constrain(this.angleVelocity, -0.1, 0.1);
    this.angle += this.angleVelocity;
    this.acceleration.mult(0);
  }

  void show() {
    strokeWeight(2);
    stroke(0);
    fill(127, 127);
    rectMode(CENTER);
    push();
    translate(this.position.x, this.position.y);
    rotate(this.angle);
    circle(0, 0, this.radius * 2);
    line(0, 0, this.radius, 0);
    pop();
  }
}
