public void settings() {
  size(400, 400);
}

public void draw() {
  noStroke();
  fill(255, 0, 0);
  ellipse((float) Math.random() * 400, (float) Math.random() * 400, 16, 16);
}
