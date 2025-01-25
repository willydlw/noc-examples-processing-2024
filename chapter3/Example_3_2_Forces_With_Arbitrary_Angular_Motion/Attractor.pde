// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Attractor {
  PVector position;
  float mass, G;
  
  Attractor() {
    this.position = new PVector(width / 2, height / 2);
    this.mass = 20;
    this.G = 1;
  }

  PVector attract(Mover mover) {
    // Calculate direction of force
    PVector force = PVector.sub(this.position, mover.position);
    // Distance between objects
    float distance = force.mag();
    // Limiting the distance to eliminate "extreme" results for very close or very far objects
    distance = constrain(distance, 5, 25);

    // Calculate gravitional force magnitude
    float strength = (this.G * this.mass * mover.mass) / (distance * distance);
    // Get force vector --> magnitude * direction
    force.setMag(strength);
    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    stroke(0);
    fill(175, 200);
    circle(this.position.x, this.position.y, this.mass * 2);
  }
}
