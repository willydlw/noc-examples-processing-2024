// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Smoke Particle System

// A basic smoke effect using a particle system
// Each particle is rendered as an alpha masked image

Emitter emitter;
PImage img;

void setup() {
  size(640, 360);
  img = loadImage("texture.png");
  emitter = new Emitter(width / 2, height - 75);
}

void draw() {
  // Try additive blending!
  // You also need clear or else the colors will accumulate between frames
  // blendMode(ADD);
  // clear();

  background(0);

  // Wind force direction based on mouseX.
  float dx = map(mouseX, 0, width, -0.2, 0.2);
  PVector wind = new PVector(dx, 0);
  emitter.applyForce(wind);
  emitter.run();
  emitter.addParticle();

  // Draw an arrow representing the wind force
  drawVector(wind, new PVector(width / 2, 50, 0), 500);
}

// Renders a vector object 'v' as an arrow and a position 'loc'
void drawVector(PVector v, PVector pos, float scayl) {
  push();
  float arrowsize = 4;
  // Translate to position to render vector
  translate(pos.x, pos.y);
  stroke(255);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag() * scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0, 0, len, 0);
  line(len, 0, len - arrowsize, +arrowsize / 2);
  line(len, 0, len - arrowsize, -arrowsize / 2);
  pop();
}
