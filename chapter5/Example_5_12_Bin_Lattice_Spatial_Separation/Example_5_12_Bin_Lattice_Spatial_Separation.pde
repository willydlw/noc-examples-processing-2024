// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

Flock flock;

// bin-lattice spatial subdivision
ArrayList<ArrayList<ArrayList<Boid>>> grid;
int cols;
int rows;
float resolution = 40; // adjust as necessary

// Creates 3D Grid Array 
void make3DArray(int cols, int rows){
  grid = new ArrayList<>();
  while(grid.size() <= rows){
    grid.add(new ArrayList<>());
  }
  
  for(int i = 0; i < rows; i++){
    ArrayList<ArrayList<Boid>> rowList = grid.get(i);
    while(rowList.size() <= cols){
      rowList.add(new ArrayList<Boid>());
    }
  }
}

void setup() {
  size(640, 360);
  cols = floor(width / resolution);
  rows = floor(height / resolution);
  make3DArray(cols, rows);
  
  flock = new Flock();
  
  // Add an initial set of boids into the system
  for (int i = 0; i < 800; i++) {
    Boid boid = new Boid(random(width), random(height));
    flock.addBoid(boid);
  }
}

void draw() {
  background(255);

  // Reset grid at the beginning of each frame
  for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){
      grid.get(i).get(j).clear();
    }
  }

  // Place each boid into the appropriate cell in the grid
  for (Boid boid : flock.boids) {
    int col = floor(boid.position.x / resolution);
    int row = floor(boid.position.y / resolution);
    col = constrain(col, 0, cols - 1);
    row = constrain(row, 0, rows - 1);
    grid.get(row).get(col).add(boid);
  }

  // Draw the grid
  stroke(200);
  strokeWeight(1);

  // Draw vertical lines
  for (int i = 0; i <= cols; i++) {
    float x = i * resolution;
    line(x, 0, x, height);
  }

  // Draw horizontal lines
  for (int j = 0; j <= rows; j++) {
    float y = j * resolution;
    line(0, y, width, y);
  }

  // Highlight the 3x3 neighborhood the mouse is over
  int mouseCol = floor(mouseX / resolution);
  int mouseRow = floor(mouseY / resolution);
  noStroke();
  fill(255, 50, 50, 100); // Semi-transparent red
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int col = mouseCol + i;
      int row = mouseRow + j;
      // Check if the cell is within the grid
      if (col >= 0 && col < cols && row >= 0 && row < rows) {
        rect(col * resolution, row * resolution, resolution, resolution);
      }
    }
  }

  flock.run();
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX, mouseY));
}
