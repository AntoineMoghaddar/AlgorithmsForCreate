class Ball {
  PVector l, v, g;  

  Ball(PVector locationInput) {
    l = locationInput;//The current location of the ball (init)
    v = new PVector(3, -4.1); // The velocity of the ball
    g = new PVector(0, 0.2); // The Gravity of the ball
  }

  void display() {
    // Display circle at location vector
    stroke(255);
    strokeWeight(2);
    fill(127);
    ellipse(l.x, l.y, 48, 48);
  }

  void shoot() {
    // Add velocity to the location.
    l.add(v);
    // Add gravity to velocity
    v.add(g);
  }

  void checkWindow() {
    l.set(width/2, height/2);
    v.set(3, -4.1);
    g.set(0, 0.2);
  }


  void setBall(PVector b) {
    v = l.copy().sub(b).mult(0.1);
  }
}
