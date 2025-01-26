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
    this.velocity = new PVector(0, -2);
    this.position = new PVector(x, y);
    this.r = 6;
    this.maxspeed = 4;
    this.maxforce = 0.1;
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

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void arrive(PVector target) {
    PVector desired = PVector.sub(target, this.position); // A vector pointing from the location to the target
    float d = desired.mag();
    // Scale with arbitrary damping within 100 pixels
    if (d < 100) {
      float m = map(d, 0, 100, 0, this.maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(this.maxspeed);
    }

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, this.velocity);
    steer.limit(this.maxforce);  // Limit to maximum steering force
    this.applyForce(steer);
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
