// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Mover object
Bob bob;

// Spring object
Spring spring;

void setup() {
  size(640, 360);
  // Create objects at starting position
  // Note third argument in Spring constructor is "rest length"
  spring = new Spring(width / 2, 30, 100);
  bob = new Bob(width / 2, 100);
}

void draw() {
  background(255);

  // Apply a gravity force to the bob
  PVector gravity = new PVector(0, 2);
  bob.applyForce(gravity);


  // Update bob
  bob.update();
  bob.handleDrag(mouseX, mouseY);

  // Connect the bob to the spring (this calculates the force)
  spring.connect(bob);

  // Constrain spring distance between min and max
  spring.constrainLength(bob, 30, 200);

  // Draw everything
  spring.showLine(bob); // Draw a line between spring and bob
  bob.show();
  spring.show();
}

void mousePressed() {
  bob.handleClick(mouseX, mouseY);
}

void mouseReleased() {
  bob.stopDragging();
}
