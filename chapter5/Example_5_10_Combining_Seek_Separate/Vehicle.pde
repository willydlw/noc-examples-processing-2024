// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Vehicle object

class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxspeed;
  float maxforce;
  
  Vehicle(float x, float y) {
    // All the usual stuff
    this.position = new PVector(x, y);
    this.r = 6;
    this.maxspeed = 3; // Maximum speed
    this.maxforce = 0.2; // Maximum steering force
    this.acceleration = new PVector(0, 0);
    this.velocity = new PVector(0, 0);
  }

  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separateForce = this.separate(vehicles);
    PVector seekForce = this.seek(new PVector(mouseX, mouseY));

    separateForce.mult(1.5);
    seekForce.mult(0.5);

    this.applyForce(separateForce);
    this.applyForce(seekForce);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    this.acceleration.add(force);
  }

  // Separation
  // Method checks for nearby vehicles and steers away
  PVector separate(ArrayList<Vehicle> vehicles) {
    float desiredSeparation = this.r * 2;
    PVector sum = new PVector();
    int count = 0;
    // For every vehicle in the system, check if it's too close
    for (Vehicle other : vehicles) {
      float d = PVector.dist(this.position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if (this != other && d < desiredSeparation) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(this.position, other.position);
        diff.setMag(1 / d); // Weight by distance
        sum.add(diff);
        count++; // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.setMag(this.maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(this.velocity);
      sum.limit(this.maxforce);
    }
    return sum;
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, this.position); // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(this.maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, this.velocity);
    steer.limit(this.maxforce); // Limit to maximum steering force
    return steer;
  }

  // Method to update location
  void update() {
    // Update velocity
    this.velocity.add(this.acceleration);
    // Limit speed
    this.velocity.limit(this.maxspeed);
    this.position.add(this.velocity);
    // Reset accelertion to 0 each cycle
    this.acceleration.mult(0);
  }

  void show() {
    fill(127);
    stroke(0);
    strokeWeight(2);
    push();
    translate(this.position.x, this.position.y);
    circle(0, 0, this.r * 2);
    pop();
  }

  // Wraparound
  void borders() {
    if (this.position.x < -this.r) this.position.x = width + this.r;
    if (this.position.y < -this.r) this.position.y = height + this.r;
    if (this.position.x > width + this.r) this.position.x = -this.r;
    if (this.position.y > height + this.r) this.position.y = -this.r;
  }
}
