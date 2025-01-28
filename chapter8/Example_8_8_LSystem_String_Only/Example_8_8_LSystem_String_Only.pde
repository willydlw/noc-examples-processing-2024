// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple L-system Sentence Generation

//{!1} Start with an axiom.
String current = "A";
PFont courier;


void setup() {
  size(640, 160);
  background(255);
  noLoop();
  courier = createFont("courier", 16);
  fill(0);
  // 9 generations
  for (int i = 0; i < 9; i++) {
    generate();
    // Render text to canvas
    textFont(courier);
    text(i + ": " + current, 4, 20 + i * 16);
  }
}

void generate() {
  String next = "";
  for (int i = 0; i < current.length(); i++) {
    // For every character of the current sentence
    char c = current.charAt(i);
    //{!5} Apply the production rules A->AB, B->A
    if (c == 'A') {
      next += "AB";
    } else if (c == 'B') {
      next += "A";
    }
  }
  // Save the next generation
  current = next;
}
