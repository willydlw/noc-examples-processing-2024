class Bird {
  int x;
  int y;
  float velocity;
  float gravity;
  int flapForce;

  Bird() {
    // The bird's position (x will be constant)
    this.x = 50;
    this.y = 120;

    // Velocity and forces are scalar since the bird only moves along the y-axis
    this.velocity = 0;
    this.gravity = 0.5;
    this.flapForce = -10;
  }

  // The bird flaps its wings
  void flap() {
    this.velocity += this.flapForce;
  }

  void update() {
    // Add gravity
    this.velocity += this.gravity;
    this.y += this.velocity;
    // Dampen velocity
    this.velocity *= 0.95;

    // Handle the "floor"
    if (this.y > height) {
      this.y = height;
      this.velocity = 0;
    }
  }

  void show() {
    strokeWeight(2);
    stroke(0);
    fill(127);
    circle(this.x, this.y, 16);
  }
}
