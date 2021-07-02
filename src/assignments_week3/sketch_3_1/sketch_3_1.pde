Ball b;
Catapult cat;

boolean release = false;

void setup() {
  size(640, 360);
  b = new Ball();
  cat = new Catapult();
}

void draw() {
  background(0);
  b.display(); //display ball
  cat.display(); // display catapult

  if (release) {
    b.shoot();
  }

  if (b.loc.y > height) {
    b.checkWindow(); // Ball Reset
    release = false;
  }
}

void mouseClicked() {
  release = true;
}
