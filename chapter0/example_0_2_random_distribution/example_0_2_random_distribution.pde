// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An array to keep track of how often random numbers are picked

int randomCounts[];
int total = 20;

void setup() {
  size(640, 240);
  randomCounts = new int[total];
  for (int i = 0; i < total; i++) {
    randomCounts[i] = 0;
  }
}

void draw() {
  background(255);
  int index = floor(random(total));
  randomCounts[index]++;

  // Draw a rectangle to graph results
  stroke(0);
  strokeWeight(2);
  fill(127);
  int w = width / randomCounts.length;

  for (int x = 0; x < randomCounts.length; x++) {
    rect(x * w, height - randomCounts[x], w - 1, randomCounts[x]);
  }
}
