// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Liquid {
  float x,y,w,h,c;
  
  Liquid(float x, float y, float w, float h, float c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }

  // Is the Mover in the Liquid?
  boolean contains(Mover mover) {
    PVector pos = mover.position;
    return (
      pos.x > this.x &&
      pos.x < this.x + this.w &&
      pos.y > this.y &&
      pos.y < this.y + this.h
    );
  }

  // Calculate drag force
  PVector calculateDrag(Mover mover) {
    // Magnitude is coefficient * speed squared
    float speed = mover.velocity.mag();
    float dragMagnitude = this.c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = mover.velocity.copy();
    dragForce.mult(-1);

    // Scale according to magnitude
    dragForce.setMag(dragMagnitude);
    return dragForce;
  }

  void show() {
    noStroke();
    fill(220);
    rect(this.x, this.y, this.w, this.h);
  }
}
