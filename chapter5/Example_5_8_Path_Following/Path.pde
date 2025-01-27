// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Path Following


class Path {
  float radius;
  ArrayList<PVector> points;
  
  Path() {
    // A path has a radius, i.e how far is it ok for the vehicle to wander off
    this.radius = 20;
    // A Path is an array of points (PVector objects)
    this.points = new ArrayList<PVector>();
  }

  // Add a point to the path
  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    this.points.add(point);
  }

  PVector getStart() {
    return this.points.get(0);
  }

  PVector getEnd() {
    return this.points.get(this.points.size() - 1);
  }


  // Draw the path
  void show() {
    // Draw thick line for radius
    stroke(200);
    strokeWeight(this.radius * 2);
    noFill();
    beginShape();
    for (PVector pathPoint : this.points) {
      vertex(pathPoint.x, pathPoint.y);
    }
    endShape();
    // Draw thin line for center of path
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector pathPoint : this.points) {
      vertex(pathPoint.x, pathPoint.y);
    }
    endShape();
  }
}
