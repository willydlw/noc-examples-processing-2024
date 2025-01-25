// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Repeller {
  PVector position;
  float power;
  
  Repeller(float x, float y) {
    this.position = new PVector(x, y);
    // How strong is the repeller?
    this.power = 150;
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    circle(this.position.x, this.position.y, 32);
  }

  PVector repel(Particle particle) {
    // This is the same repel algorithm we used in Chapter 2: forces based on gravitational attraction.
    PVector force = PVector.sub(this.position, particle.position);
    float distance = force.mag();
    distance = constrain(distance, 5, 50);
    float strength = (-1 * this.power) / (distance * distance);
    force.setMag(strength);
    return force;
  }
}
