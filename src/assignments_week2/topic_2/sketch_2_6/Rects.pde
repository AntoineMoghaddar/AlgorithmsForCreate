class Rects {

  float w, h;
  int p3, p4;

  Rects(float w, float h, int parthree, int parfour) {
    this.w = w;
    this.h = h;
    this.p3 = parthree;
    this.p4 = parfour;
  }

  void display() {
    rect(w, h, p3, p4);
  }

  void decreaseW() {
    this.w--;
  }
}
