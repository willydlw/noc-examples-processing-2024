// Daniel Shiffman
// http://natureofcode.com

// An LSystem has a starting sentence
// An a ruleset
// Each generation recursively replaces characters in the sentence
// Based on the ruleset

// Construct an LSystem with a starting sentence and a ruleset
class LSystem {
  String sentence;
  HashMap<Character, String> ruleset;

  LSystem(String axiom, HashMap<Character, String> rules) {
    this.sentence = axiom; // The sentence (a String)
    this.ruleset = rules; // The ruleset (a HashMap of Rule)
  }

  // Generate the next generation
  void generate() {
    // An empty string that we will fill
    String nextgen = "";
    // For every character in the sentence
    for (int i = 0; i < this.sentence.length(); i++) {
      // What is the character
      char c = this.sentence.charAt(i);
      // Replace it with itself unless it matches one of our rules
      if (this.ruleset.get(c) != null) {
        nextgen += this.ruleset.get(c);
      } else {
        nextgen += c;
      }
    }
    // Replace sentence
    this.sentence = nextgen;
  }
}
