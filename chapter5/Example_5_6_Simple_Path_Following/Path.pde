// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Path Following

class Path {
  float radius;
  PVector start;
  PVector end;
  
  Path() {
    // A path has a radius, i.e how far is it ok for the boid to wander off
    this.radius = 20;
    // A Path is line between two points (p5.Vector objects)
    this.start = new PVector(0, height / 3);
    this.end = new PVector(width, 2 * height / 3);
  }

  // Draw the path
  void show() {

    strokeWeight(this.radius * 2);
    stroke(0, 50);
    line(this.start.x, this.start.y, this.end.x, this.end.y);

    strokeWeight(1);
    stroke(0);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
  }
}
