

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover{
  PVector position, velocity, acceleration;
  float topSpeed;
  
  Mover(){
    this.position = new PVector(width/2,height/2);
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.topSpeed = 5;
  }

  void update() {
    // The random2D() function returns a unit vector pointing in a random direction.
    this.acceleration = PVector.random2D();
    this.acceleration.mult(random(2));

    this.velocity.add(this.acceleration);
    this.velocity.limit(this.topSpeed);
    this.position.add(this.velocity);
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    circle(this.position.x, this.position.y, 48);
  }

  void checkEdges() {

    if (this.position.x > width) {
      this.position.x = 0;
    }
    else if (this.position.x < 0) {
      this.position.x = width;
    }

    if (this.position.y > height) {
      this.position.y = 0;
    }
    else if (this.position.y < 0) {
      this.position.y = height;
    }
  }

}
