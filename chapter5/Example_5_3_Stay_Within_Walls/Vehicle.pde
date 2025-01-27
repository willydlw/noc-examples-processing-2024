// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// The "Vehicle" class

class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxspeed;
  float maxforce;
  
  Vehicle(float x, float y) {
    this.acceleration = new PVector(0, 0);
    this.velocity = new PVector(3, 4);
    this.position = new PVector(x, y);
    this.r = 6;
    this.maxspeed = 3;
    this.maxforce = 0.15;
  }

  // Method to update location
  void update() {
    // Update velocity
    this.velocity.add(this.acceleration);
    // Limit speed
    this.velocity.limit(this.maxspeed);
    this.position.add(this.velocity);
    // Reset accelerationelertion to 0 each cycle
    this.acceleration.mult(0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    this.acceleration.add(force);
  }

  void boundaries(int offset) {
    PVector desired = null;

    if (this.position.x < offset) {
      desired = new PVector(this.maxspeed, this.velocity.y);
    } else if (this.position.x > width - offset) {
      desired = new PVector(-this.maxspeed, this.velocity.y);
    }

    if (this.position.y < offset) {
      desired = new PVector(this.velocity.x, this.maxspeed);
    } else if (this.position.y > height - offset) {
      desired = new PVector(this.velocity.x, -this.maxspeed);
    }

    if (desired != null) {
      desired.normalize();
      desired.mult(this.maxspeed);
      PVector steer = PVector.sub(desired, this.velocity);
      steer.limit(this.maxforce);
      this.applyForce(steer);
    }
  }

  void show() {
    // Draw a triangle rotated in the direction of velocity
    float angle = this.velocity.heading();
    fill(127);
    stroke(0);
    strokeWeight(2);
    push();
    translate(this.position.x, this.position.y);
    rotate(angle);
    beginShape();
    vertex(this.r * 2, 0);
    vertex(-this.r * 2, -this.r);
    vertex(-this.r * 2, this.r);
    endShape(CLOSE);
    pop();
  }
}
