int posX, posY;

RedDot() {
  posX = int(random(0, width));
  posY = int(random(0, height));
}

public void settings() {
  size(400, 400);
}

public void display() {
  noStroke();
  fill(255, 0, 0);
  ellipse(posY, posY, 16, 16);
}
