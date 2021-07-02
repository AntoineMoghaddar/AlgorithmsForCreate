class SnowFlake {
  float changeAngle;
  PImage flake;
  float dx;
  float dy;
  float posX, posY;
  int size  = 100;

  SnowFlake(PImage snow2, float snowFlakeX, float snowFlakeY) {
    flake = snow2;
    posX = snowFlakeX;
    posY = snowFlakeY;
    dx = random(-4, 4);
    dy = random(-4, 4);
  }

  void display() {
    //display and rotate snowflake to the left
    pushMatrix();
    imageMode(CENTER);
    //translate the image to this point, which later on in the method falldown will be adjusted
    translate (posX, posY);
    rotate (changeAngle=changeAngle-0.05);
    image (flake, 0, 0, width/7, height/7);
    popMatrix();
  }

  void falldown() {
    //bouncing off the walls
    posX += dx;
    posY += dy;
    if (posX<size/2 && dx<0) {
      dx = -dx;
    }
    if (posY<size/2 && dy<0) {
      dy = -dy;
    }   
    if (posX>width-size/2 && dx > 0) {
      dx=-dx;
    }
    if (posY>height-size/2 && dy > 0) {
      dy = -dy;
    }
  }
}
