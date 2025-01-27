 class Path {
   float radius;
   ArrayList<PVector> points;
   
   Path() {
    this.radius = 20;  
    // create empty ArrayList that will store PVector objects
    this.points = new ArrayList<PVector>();
  }

  //{!4} This method allows us to add points to the path.
  void addPoint(float x, float y) {
    PVector pathPoint = new PVector(x, y);
    this.points.add(pathPoint);
  }

  void show() {
    //{!8} Draw a thicker gray line for the path radius.
    stroke(200);
    strokeWeight(this.radius * 2);
    noFill();
    beginShape();
    for (PVector pathPoint : this.points) {
      vertex(pathPoint.x, pathPoint.y);
    }
    endShape();

    //{!7} Draw a thin line for the path center.
    stroke(0);
    strokeWeight(1);
    beginShape();
    for (PVector pathPoint : this.points) {
      vertex(pathPoint.x, pathPoint.y);
    }
    endShape();
  }
}
