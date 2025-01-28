// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

LSystem lsystem;
Turtle turtle;

void setup() {
  size(640, 360);

  HashMap<Character, String> rules = new HashMap<Character, String>();
  rules.put('F', "FF+[+F-F-F]-[-F+F+F]");
  lsystem = new LSystem("F", rules);
  turtle = new Turtle(6, radians(25));

  for (int i = 0; i < 4; i++) {
    lsystem.generate();
  }

  // Some other rules
  // HashMap<Character, String> ruleset = new HashMap<Character, String>();
  // ruleset.put('F', "F[F]-F+F[--F]+F-F");
  // lsystem = new LSystem("F-F-F-F", ruleset);
  // turtle = new Turtle(4, PI / 2);

  // HashMap<Character, String> ruleset = new HashMap<Character, String>();
  // ruleset.put('F', "F--F--F--G");
  // ruleset.put('G', "GG");
  // lsystem = new LSystem("F--F--F", ruleset);
  // turtle = new Turtle(16, PI / 3);
}

void draw() {
  background(255);
  translate(width / 2, height);
  turtle.render(lsystem.sentence);
  noLoop();
}
