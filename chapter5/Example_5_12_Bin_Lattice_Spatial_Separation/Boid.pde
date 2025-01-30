// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Boid class
// Methods for Separation, Cohesion, Alignment added

class Boid {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxspeed;
  float maxforce;
  
  Boid(float x, float y) {
    this.acceleration = new PVector(0, 0);
    this.velocity = new PVector(random(-1, 1), random(-1, 1));
    this.position = new PVector(x, y);
    this.r = 3.0;
    this.maxspeed = 3; // Maximum speed
    this.maxforce = 0.05; // Maximum steering force
  }
  
  // No argument to run() anymore, could bring in grid 
  // but accessing it as global variable instead
  void run() {
    int col = (int)Math.floor(this.position.x / resolution);
    int row = (int)Math.floor(this.position.y / resolution);
    ArrayList<Boid> neighbors = new ArrayList<>();

    // Check cells in a 3x3 block around the current boid
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        int newCol = col + i;
        int newRow = row + j;
        // Make sure this is a valid cell
        if (newCol >= 0 && newCol < cols && newRow >= 0 && newRow < rows) {
          // Add all boids in this cell to neighbors
          grid.get(newRow).get(newCol);
          
          ArrayList<Boid> cell = grid.get(newRow).get(newCol);
          for(int b = 0; b < cell.size(); b++){
            neighbors.add(cell.get(b));
          }
        }
      }
    }
    
    this.flock(neighbors);
    this.update();
    this.borders();
    this.show();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    this.acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = this.separate(boids); // Separation
    PVector ali = this.align(boids); // Alignment
    PVector coh = this.cohesion(boids); // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    // Add the force vectors to acceleration
    this.applyForce(sep);
    this.applyForce(ali);
    this.applyForce(coh);
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

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, this.position); // A vector pointing from the location to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(this.maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, this.velocity);
    steer.limit(this.maxforce); // Limit to maximum steering force
    return steer;
  }

  void show() {
    // Draw a triangle rotated in the direction of velocity
    float angle = this.velocity.heading();
    fill(127);
    stroke(0);
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

  // Wraparound
  void borders() {
    if (this.position.x < -this.r) this.position.x = width + this.r;
    if (this.position.y < -this.r) this.position.y = height + this.r;
    if (this.position.x > width + this.r) this.position.x = -this.r;
    if (this.position.y > height + this.r) this.position.y = -this.r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate(ArrayList<Boid> boids) {
    float desiredseparation = 25.0;
    PVector steer = new PVector(0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0; i < boids.size(); i++) {
      float d = PVector.dist(this.position, boids.get(i).position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if (d > 0 && d < desiredseparation) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(this.position, boids.get(i).position);
        diff.normalize();
        diff.div(d); // Weight by distance
        steer.add(diff);
        count++; // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div(count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(this.maxspeed);
      steer.sub(this.velocity);
      steer.limit(this.maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align(ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (int i = 0; i < boids.size(); i++) {
      float d = PVector.dist(this.position, boids.get(i).position);
      if (d > 0 && d < neighbordist) {
        sum.add(boids.get(i).velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(this.maxspeed);
      PVector steer = PVector.sub(sum, this.velocity);
      steer.limit(this.maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion(ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0); // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0; i < boids.size(); i++) {
      float d = PVector.dist(this.position, boids.get(i).position);
      if (d > 0 && d < neighbordist) {
        sum.add(boids.get(i).position); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return this.seek(sum); // Steer towards the location
    } else {
      return new PVector(0, 0);
    }
  }
}
