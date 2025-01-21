// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker walker;

void setup() {
  size(640, 360);
  walker = new Walker();
  background(255);
}

void draw() {
  walker.step();
  walker.show();
}

class Walker {
  float x,y;
  
  Walker() {
    this.x = width / 2;
    this.y = height / 2;
  }

  void show() {
    stroke(0);
    point(this.x, this.y);
  }

  void step() {
    int choice = floor(random(4));
    if (choice == 0) {
      this.x++;
    } else if (choice == 1) {
      this.x--;
    } else if (choice == 2) {
      this.y++;
    } else {
      this.y--;
    }
  }
}
