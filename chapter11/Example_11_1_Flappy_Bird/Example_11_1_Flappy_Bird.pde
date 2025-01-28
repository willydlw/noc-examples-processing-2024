import java.util.List;

Bird bird;
List<Pipe> pipes = new ArrayList();

void setup() {
  size(640, 360);
  bird = new Bird();
  pipes.add(new Pipe());
}

void draw() {
  background(255);

  for (int i = pipes.size() - 1; i >= 0; i--) {
    pipes.get(i).show();
    pipes.get(i).update();

    if (pipes.get(i).collides(bird)) {
      text("OOPS!", pipes.get(i).x, pipes.get(i).top + 20);
    }

    if (pipes.get(i).offscreen()) {
      pipes.remove(i);
    }
  }

  bird.update();
  bird.show();

  if (frameCount % 100 == 0) {
    pipes.add(new Pipe());
  }
}

void mousePressed() {
  bird.flap();
}
