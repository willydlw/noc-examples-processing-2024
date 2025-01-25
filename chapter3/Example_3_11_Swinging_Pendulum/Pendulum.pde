// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pendulum

// A Simple Pendulum Class

// This constructor could be improved to allow a greater variety of pendulums
class Pendulum {
  PVector pivot, bob;
  float r;
  float angle, angleVelocity, angleAcceleration;
  float damping;
  float ballr;
  boolean dragging;
  
  Pendulum(float x, float y, float r) {
    // Fill all variables
    this.pivot = new PVector(x, y);
    this.bob = new PVector();
    this.r = r;
    this.angle = PI / 4;
    this.angleVelocity = 0.0;
    this.angleAcceleration = 0.0;
    this.damping = 0.995; // Arbitrary damping
    this.ballr = 24.0; // Arbitrary ball radius
    this.dragging = false;
  }

  // Function to update position
  void update() {
    // As long as we aren't dragging the pendulum, let it swing!
    if (!this.dragging) {
      float gravity = 0.4; // Arbitrary constant
      this.angleAcceleration = ((-1 * gravity) / this.r) * sin(this.angle); // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)

      this.angleVelocity += this.angleAcceleration; // Increment velocity
      this.angle += this.angleVelocity; // Increment angle

      this.angleVelocity *= this.damping; // Apply some damping
    }
  }

  void show() {
    this.bob.set(this.r * sin(this.angle), this.r * cos(this.angle), 0); // Polar to cartesian conversion
    this.bob.add(this.pivot); // Make sure the position is relative to the pendulum's origin

    stroke(0);
    strokeWeight(2);
    // Draw the arm
    line(this.pivot.x, this.pivot.y, this.bob.x, this.bob.y);
    fill(127);
    // Draw the ball
    circle(this.bob.x, this.bob.y, this.ballr * 2);
  }

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the pendulum ball
  void clicked(float mx, float my) {
    float d = dist(mx, my, this.bob.x, this.bob.y);
    if (d < this.ballr) {
      this.dragging = true;
    }
  }

  // This tells us we are not longer clicking on the ball
  void stopDragging() {
    this.angleVelocity = 0; // No velocity once you let go
    this.dragging = false;
  }

  void drag() {
    // If we are draging the ball, we calculate the angle between the
    // pendulum origin and mouse position
    // we assign that angle to the pendulum
    if (this.dragging) {
      PVector diff = PVector.sub(this.pivot, new PVector(mouseX, mouseY)); // Difference between 2 points
      this.angle = atan2(-1 * diff.y, diff.x) - radians(90); // Angle relative to vertical axis
    }
  }
}
