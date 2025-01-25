// Nature of Code
// Daniel Shiffman
// Chapter 3: Oscillation

// Object to describe an anchor point that can connect to "Bob" objects via a spring
// Thank you: http://www.myphysicslab.com/spring2d.html

class Spring {
  PVector anchor;
  float restLength, k;
  
  Spring(float x, float y, float len) {
    this.anchor = new PVector(x, y);
    this.restLength = len;
    this.k = 0.2;
  }
  // Calculate and apply spring force
  void connect(Bob bob) {
    // Vector pointing from anchor to bob location
    PVector force = PVector.sub(bob.position, this.anchor);
    // What is distance
    float currentLength = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = currentLength - this.restLength;

    // Direction and magnitude together!
    force.setMag(-1 * this.k * stretch);

    // Call applyForce() right here!
    bob.applyForce(force);
  }

  void constrainLength(Bob bob, float minlen, float maxlen) {
    // Vector pointing from Bob to Anchor
    PVector direction = PVector.sub(bob.position, this.anchor);
    float len = direction.mag();

    // Is it too short?
    if (len < minlen) {
      direction.setMag(minlen);
      // Keep position within constraint.
      bob.position = PVector.add(this.anchor, direction);
      bob.velocity.mult(0);
      // Is it too long?
    } else if (len > maxlen) {
      direction.setMag(maxlen);
      // Keep position within constraint.
      bob.position = PVector.add(this.anchor, direction);
      bob.velocity.mult(0);
    }
  }

  // Draw the anchor.
  void show() {
    fill(127);
    circle(this.anchor.x, this.anchor.y, 10);
  }

  // Draw the spring connection between Bob position and anchor.
  void showLine(Bob bob) {
    stroke(0);
    line(bob.position.x, bob.position.y, this.anchor.x, this.anchor.y);
  }
}
