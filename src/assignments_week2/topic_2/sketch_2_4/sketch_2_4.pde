Dot[] dots;
int counter = 0;

void setup() {
  dots = new Dot[100000]; // create an array of dots that is large enough to fill the screen
  size(500, 500);
  background(255);
}

void draw() {
  background(255);
  dots[counter] = new Dot(); // places the drawn dots within this array


  for (int i = 0; i<counter; i++) {
    while (dist(dots[counter].dotx, dots[counter].doty, dots[i].dotx, dots[i].doty)<(dots[counter].size/2+dots[i].size/2)) {
      dots[counter].size --; // decrease size if the dots are too near
    }
    dots[i].display();
  }
  counter ++; // count up until 100 000
}
