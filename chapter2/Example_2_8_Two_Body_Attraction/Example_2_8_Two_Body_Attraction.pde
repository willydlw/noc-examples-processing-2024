// Mutual Attract// The Nature of Code

Body bodyA;
Body bodyB;

float G = 1;

void setup() {
  size(640, 360);
  bodyA = new Body(320, 60);
  bodyB = new Body(320, 300);
  bodyA.velocity = new PVector(1, 0);
  bodyB.velocity = new PVector(-1, 0);
}

void draw() {
  background(255);

  bodyA.attract(bodyB);
  bodyB.attract(bodyA);

  bodyA.update();
  bodyA.show();
  bodyB.update();
  bodyB.show();
}
