class Pipe {
  int spacing;
  float top;
  float bottom;
  int x;
  int w;
  int velocity;

  Pipe() {
    this.spacing = 100;
    this.top = random(height - this.spacing);
    this.bottom = this.top + this.spacing;
    this.x = width;
    this.w = 20;
    this.velocity = 2;
  }

  boolean collides(Bird bird) {
    // Is the bird within the vertical range of the top or bottom pipe?
    boolean verticalCollision = bird.y < this.top || bird.y > this.bottom;
    // Is the bird within the horizontal range of the pipes?
    boolean horizontalCollision = bird.x > this.x && bird.x < this.x + this.w;
    // If it's both a vertical and horizontal hit, it's a hit!
    return verticalCollision && horizontalCollision;
  }

  void show() {
    fill(0);
    noStroke();
    rect(this.x, 0, this.w, this.top);
    rect(this.x, this.bottom, this.w, height - this.bottom);
  }

  void update() {
    this.x -= this.velocity;
  }

  boolean offscreen() {
    return this.x < -this.w;
  }
}
