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
  
  Vehicle(float x, float y, float ms, float mf) {
    this.position = new PVector(x, y);
    this.acceleration = new PVector(0, 0);
    this.velocity = new PVector(0, 0);
    this.r = 4;
    this.maxspeed = ms;
    this.maxforce = mf;
  }

  void run() {
    this.update();
    this.borders();
    this.show();
  }

  // Implementing Reynolds' flow field following algorithm
  // http://www.red3d.com/cwr/steer/FlowFollow.html
  void follow(FlowField flow) {
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(this.position);
    // Scale it up by maxspeed
    desired.mult(this.maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, this.velocity);
    steer.limit(this.maxforce); // Limit to maximum steering force
    this.applyForce(steer);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    this.acceleration.add(force);
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

  // Wraparound
  void borders() {
    if (this.position.x < -this.r) this.position.x = width + this.r;
    if (this.position.y < -this.r) this.position.y = height + this.r;
    if (this.position.x > width + this.r) this.position.x = -this.r;
    if (this.position.y > height + this.r) this.position.y = -this.r;
  }

  void show() {
    // Draw a triangle rotated in the direction of velocity
    float theta = this.velocity.heading();
    fill(127);
    stroke(0);
    strokeWeight(2);
    push();
    translate(this.position.x, this.position.y);
    rotate(theta);
    beginShape();
    vertex(this.r * 2, 0);
    vertex(-this.r * 2, -this.r);
    vertex(-this.r * 2, this.r);
    endShape(CLOSE);
    pop();
  }
}
