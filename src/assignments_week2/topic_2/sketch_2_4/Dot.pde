// create a dot that has its own behaviour, like position on the screen and size
class Dot {
  //get a random position on the screen
  float dotx = random(0, width);
  float doty = random(0, height);
  float size = 50;

  Dot() {
  }

  void display() {
    fill(0);
    ellipse(dotx, doty, size, size);
  }
}
