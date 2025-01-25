// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector position, velocity, acceleration;
  float lifespan;
  
  Particle(float x, float y) {
    this.position = new PVector(x, y);
    float vx = (randomGaussian() * 0.3);
    float vy = (randomGaussian() * 0.3) - 1;
    this.velocity = new PVector(vx, vy);
    this.acceleration = new PVector(0, 0);
    this.lifespan = 100.0;
  }

  void run() {
    this.update();
    this.show();
  }

  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector force) {
    this.acceleration.add(force);
  }

  // Method to update position
  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.lifespan -= 2;
    this.acceleration.mult(0); // clear Acceleration
  }

  // Method to draw
  void show() {
    tint(255, this.lifespan);
    imageMode(CENTER);
    image(img, this.position.x, this.position.y);
    // Drawing a circle instead
    // fill(255, lifespan);
    // noStroke();
    // circle(pos.x, pos.y, img.width);
  }

  // Is the particle still useful?
  boolean isDead() {
   return (this.lifespan < 0.0);
  }
}
