// The Nature of Code Exercise 0.3
// p5js solution by Rick Sidwell adapted to processsing
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

  void step() {
    float r = random(1.0);     // generate random number in range[0,1.0)
                               // 50% of values are < 0.5
    if (r < 0.5) {             // walk towards mouse
        if(r < 0.25){          // walk towards mouseX
          if (this.x < mouseX) { 
            this.x++;       
          } else {
            this.x--;
        }
      } else {                 // walk towards mouseY
        if (this.y < mouseY) { // walker is above mouse
          this.y++;
        } else {
          this.y--;
        }
      }
    } else {                  // r >= 0.5, randomly choose direction
      int choice = floor(random(4));
      switch(choice){
        case 0:
          this.x++;
          break;
        case 1:
          this.x--;
          break;
        case 2:
          this.y++;
          break;
        case 3:
          this.y--;
      }
    }
  }
}
