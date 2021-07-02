ArrayList<RedDot> dots;
static int i = 0;

void setup() {
  size(800, 800);
  dots = new ArrayList<RedDot>();
}

void draw() {
  background(255);
  for (int i = 0; i < dots.size(); i++) {
    dots.get(i).display();
  }

  dots.add(new RedDot(int(random(0, width)), int(random(0, height))));
}
