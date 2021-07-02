public class RedDot { 
  int posX, posY;

  RedDot(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
  }

  public void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(posX, posY, 16, 16);
  }
}
