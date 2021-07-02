class Catapult {
  Ball ball;
  boolean release = false;
  PVector catLoc;

  Catapult() {
    ball = new Ball(new PVector(300, 200));
  }

  void display() {
    fill(165, 42, 42);
    rectMode(CENTER);
    rect(300, 250, 20, 100);

    //ball
    ball.display();
  }

  void update() {
    if (ball.l.y > height) {
      ball.checkWindow();
      release = false;
    }
    //reset ball if off the screen
    if (release) {
      ball.shoot();
    }
  }

  void mouseDraggedEvent(PVector i) {
    ball.setBall(i);
  }

  void mouseReleasedEvent() {
    release = true;
  }
}
