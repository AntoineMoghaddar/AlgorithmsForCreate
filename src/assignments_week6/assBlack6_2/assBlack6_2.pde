Flower flower;
void setup() {
  flower = new Flower();
  size(800, 800);
}

void draw() {
  background(255);
  flower.update();
}
