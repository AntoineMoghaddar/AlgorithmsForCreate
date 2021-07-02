class Boat {
  PVector location;

  float anglePaddle;
  float speedPaddle;

  Boat(int w, int h) {
    location = new PVector(w, h);
    speedPaddle = 0.02;
  }


  void display() {
    noStroke();
    fill(255, 128, 0);
    rectMode(CENTER);
    rect(location.x, location.y, 30, 100);
    triangle(location.x - 15, location.y - 50, location.x, location.y - 80, location.x + 15, location.y - 50);
    triangle(location.x - 15, location.y + 50, location.x, location.y + 80, location.x + 15, location.y + 50);

    //seat
    fill(204, 102, 0);
    ellipse(location.x, location.y, 20, 40);

    //paddles
    anglePaddle = anglePaddle + speedPaddle; 

    pushMatrix();
    translate(location.x, location.y);
    rotate(anglePaddle);
    fill(128, 42, 0);
    rect(0, 0, 90, 5);
    fill(255, 128, 0);
    ellipse(- 45, 0, 30, 20);
    ellipse(45, 0, 30, 20);
    popMatrix();

    if (anglePaddle > QUARTER_PI || anglePaddle < -QUARTER_PI) {
      speedPaddle *= -1;
    }
  }
}
