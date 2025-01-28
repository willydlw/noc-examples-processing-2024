// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Stochastic Tree
// Renders a simple tree-like structure via recursion
// Angles and number of branches are random

void setup() {
  size(640, 360);
  frameRate(1);
}

void draw() {
  background(255);

  stroke(0);
  push();
  // Start the tree from the bottom of the screen
  translate(width / 2, height);
  strokeWeight(2);
  // Start the recursive branching!
  branch(100);
  pop();
}

void branch(float length) {
  // Draw the actual branch
  line(0, 0, 0, -length);
  // Move along to end
  translate(0, -length);

  // Each branch will be 2/3rds the size of the previous one
  length *= 0.67;

  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (length > 2) {
    // A random number of branches
    int n = (int) Math.floor(random(1, 4));
    for (int i = 0; i < n; i++) {
      // Picking a random angle
      float angle = random(-PI / 2, PI / 2);
      push(); // Save the current state of transformation (i.e. where are we now)
      rotate(angle); // Rotate by theta
      branch(length); // Ok, now call myself to branch again
      pop(); // Whenever we get back here, we "pop" in order to restore the previous matrix state
    }
  }
}
