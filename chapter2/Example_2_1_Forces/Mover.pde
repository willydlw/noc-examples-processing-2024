// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {
  float mass;
  PVector position,velocity,acceleration;
  
  Mover() {
    this.mass = 1;
    this.position = new PVector(width / 2, 30);
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

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127, 127);
    ellipse(this.position.x, this.position.y, 48, 48);
  }

  void checkEdges() {
    if (this.position.x > width) {
      this.position.x = width;
      this.velocity.x *= -1;
    } else if (this.position.x < 0) {
      this.velocity.x *= -1;
      this.position.x = 0;
    }
    if (this.position.y > height) {
      this.velocity.y *= -1;
      this.position.y = height;
    }
  }

}
