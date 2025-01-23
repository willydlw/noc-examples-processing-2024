// The Nature of Code, Exercise 0.1
// p5js solution by Rick Sidwell adapted to Processing
// http://natureofcode.com

Walker walker;

void setup() {
  size(640, 240);
  walker = new Walker();
  background(255);
}

void draw() {
  walker.step();
  walker.show();
}

class Walker {
  int x, y;
  
  Walker() {
    this.x = width / 2;
    this.y = height / 2;
  }

  void show() {
    stroke(0);
    point(this.x, this.y);
  }

  // Give the walker a greater tendency to move down and right
  void step() {
    // move down:  y > 0
    // move right: x > 0
    // Choosing randomly from the direction array, there is a
    // 2 out of 4 probality the choice will be 1, (move down or right)
    // 1 out of 4 probability the choice will be 0. (no movement)
    // 1 out of 4 probability the choice will be -1. (move up or left)
    int []direction = {-1, 0, 1, 1};
    int xindex = floor(random(0,4));
    int yindex = floor(random(0,4));
    int xstep = direction[xindex];
    int ystep = direction[yindex];
    this.x += xstep;
    this.y += ystep;
  }
}
