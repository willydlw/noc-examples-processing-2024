// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain

// QuadTree
// 1: https://www.youtube.com/watch?v=OJxEcs0w_kE
// 2: https://www.youtube.com/watch?v=QQx_NmCIuCY

// For more:
// https://github.com/CodingTrain/QuadTree

QuadTree qtree;

void setup() {
  size(640, 360);
  Rectangle boundary = new Rectangle(width / 2, height / 2, width, height);
  qtree = new QuadTree(boundary, 8);
  for (int i = 0; i < 2000; i++) {
    float mean = width/2.0f;
    float stdDev = width / 8.0f;
    float x = randomGaussian() * stdDev + mean;
    float y = randomGaussian() * stdDev + mean;
    Point p = new Point(x, y);
    qtree.insert(p);
  }
}

void draw() {
  background(255);
  qtree.show();

  rectMode(CENTER);
  Rectangle range = new Rectangle(mouseX, mouseY, 50, 50);

  // This check has been introduced due to a bug discussed in https://github.com/CodingTrain/website/pull/556
  if (mouseX < width && mouseY < height) {
    strokeWeight(2);
    stroke(255, 50, 50);
    fill(255, 50, 50, 50);
    rect(range.x, range.y, range.w * 2, range.h * 2);
    ArrayList<Point> points = new ArrayList<>();
    points = qtree.query(range, points);
    println(points);
    for (Point p : points) {
      strokeWeight(3);
      stroke(50, 50, 50);
      point(p.x, p.y);
    }
  }
}
