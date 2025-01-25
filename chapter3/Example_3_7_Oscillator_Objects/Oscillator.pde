// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Oscillator {
  PVector angle, angleVelocity, amplitude;
  
  Oscillator() {
    this.angle = new PVector();
    this.angleVelocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    this.amplitude = new PVector(
      random(20, width / 2),
      random(20, height / 2)
    );
  }

  void update() {
    this.angle.add(this.angleVelocity);
  }

  void show() {
    float x = sin(this.angle.x) * this.amplitude.x;
    float y = sin(this.angle.y) * this.amplitude.y;

    push();
    translate(width / 2, height / 2);
    stroke(0);
    strokeWeight(2);
    fill(127);
    line(0, 0, x, y);
    circle(x, y, 32);
    pop();
  }
}
