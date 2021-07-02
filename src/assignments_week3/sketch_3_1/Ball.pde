class Ball {
  PVector loc, v, g;

  Ball() {
    loc = new PVector(width/2, height/2); //The current location of the ball (init)
    v = new PVector(3, -4.1); // The velocity of the ball
    g = new PVector(0, 0.2); // The Gravity of the ball
  }

  void display() {
    // Display circle at location vector
    stroke(255);
    strokeWeight(2);
    fill(127);
    ellipse(loc.x, loc.y, 48, 48);
  }

  void shoot() {
    loc.add(v); // Add velocity to the location.
    v.add(g); // Add gravity to velocity
  }

  void checkWindow() {
    loc.set(width/2, height/2);
    v.set(3, -4.1);
    g.set(0, 0.2);
  }
}
