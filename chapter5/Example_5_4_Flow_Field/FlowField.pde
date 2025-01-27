// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flow Field Following

class FlowField {
  int resolution;
  int rows, cols;
  PVector [][]field;
  
  FlowField(int r) {
    this.resolution = r;
    //{!2} Determine the number of columns and rows.
    this.cols = width / this.resolution;
    this.rows = height / this.resolution;
    //{!4} A flow field is a two-dimensional array of vectors. The example includes as separate function to create that array
    
    this.field = new PVector[cols][rows];
    /*
    this.field = new Array(this.cols);
    for (let i = 0; i < this.cols; i++) {
      this.field[i] = new Array(this.rows);
    }
    */
    this.init();
  }

  // The init() function fills the 2D array with vectors
  void init() {
    // Reseed noise for a new flow field each time
    noiseSeed((long)(random(10000)));
    float xoff = 0;
    for (int i = 0; i < this.cols; i++) {
      float yoff = 0;
      for (int j = 0; j < this.rows; j++) {
        //{.code-wide} In this example, use Perlin noise to create the vectors.
        float angle = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        this.field[i][j] = PVector.fromAngle(angle);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  // Draw every vector
  void show() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        float w = width / this.cols;
        float h = height / this.rows;
        PVector v = this.field[i][j].copy();
        v.setMag(w * 0.5);
        float x = i * w + w / 2;
        float  y = j * h + h / 2;
        strokeWeight(1);
        line(x, y, x + v.x, y + v.y);
      }
    }
  }

  //{.code-wide} A function to return a p5.Vector based on a position
  PVector lookup(PVector position) {
    int column = constrain(floor(position.x / this.resolution), 0, this.cols - 1);
    int row = constrain(floor(position.y / this.resolution), 0, this.rows - 1);
    return this.field[column][row].copy();
  }
}
