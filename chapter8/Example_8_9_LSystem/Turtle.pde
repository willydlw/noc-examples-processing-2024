// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Turtle {
  int length;
  float angle;

  Turtle(int length, float angle) {
    this.length = length;
    this.angle = angle;
  }

  void render(String sentence) {
    stroke(0);
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      if (c == 'F' || c == 'G') {
        line(0, 0, 0, -this.length);
        translate(0, -this.length);
      } else if (c == '+') {
        rotate(this.angle);
      } else if (c == '-') {
        rotate(-this.angle);
      } else if (c == '[') {
        push();
      } else if (c == ']') {
        pop();
      }
    }
  }
}
