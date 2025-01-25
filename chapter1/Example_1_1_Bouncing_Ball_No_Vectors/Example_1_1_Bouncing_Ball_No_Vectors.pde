// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-1: Bouncing Ball, no vectors
// Variables for position and speed of ball.
float x = 100;
float y = 100;
float xspeed = 2.5;
float yspeed = 2;

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  background(255);

  // Move the ball according to its speed.
  x = x + xspeed;
  y = y + yspeed;

  //Check for bouncing.
  if (x > width || x < 0) {
    xspeed = xspeed * -1;
  }
  if (y > height || y < 0) {
    yspeed = yspeed * -1;
  }

  stroke(0);
  fill(127);
  strokeWeight(2);
  //Draw the ball at the position (x,y).
  circle(x, y, 48);
}
