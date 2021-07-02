class Chicken {
  PVector location, newLoc, speed;
  float xoffset, xincrement, noiseX;
  float yoffset, yincrement, noiseY;
  ParticleSystem ps;
  
  float angleWings;
  float speedWings;

  boolean hitBorder; 

  Chicken(PVector location, ParticleSystem ps) {
    this.ps = ps;
    this.location = location.copy();
    speed = new PVector(random(1, 10), random(1, 10));
 
    speedWings = 0.07;
  }

  void display() {
    noStroke();

    //render the smoke
    ps.run(location);

    //jetpack
    fill(178, 34, 34);
    rectMode(CENTER);
    rect(location.x, location.y, 70, 70);

    angleWings = angleWings + speedWings;

    //wings
    fill(204, 137, 37);
    //ellipse(location.x+30, location.y-10, 70, 20);
    //ellipse(location.x-30, location.y-10, 70, 20);

    pushMatrix();
    translate(location.x+30, location.y-10);
    rotate(angleWings);
    ellipse(0, 0, 70, 20);
    popMatrix();

    pushMatrix();
    translate(location.x-30, location.y-10);
    rotate(angleWings);
    ellipse(0, 0, 70, 20);
    popMatrix();

    //Flap the wings
    if (angleWings > QUARTER_PI || angleWings < -QUARTER_PI) {
      speedWings *= -1;
    }

    //flapje
    fill(209, 59, 0);
    ellipse(location.x, location.y-70, 10, 20);
    ellipse(location.x+8, location.y-65, 10, 10);
    ellipse(location.x-8, location.y-65, 10, 10);

    //legs
    strokeCap(ROUND);
    stroke(255, 187, 0);
    strokeWeight(8);
    line(location.x + 15, location.y+50, location.x + 15, location.y + 20);
    line(location.x - 15, location.y+50, location.x - 15, location.y + 20);
    //left foot
    strokeWeight(5);
    line(location.x - 25, location.y+50, location.x - 15, location.y + 40);
    line(location.x - 5, location.y+50, location.x - 15, location.y + 40);
    //right foot
    line(location.x + 25, location.y+50, location.x + 15, location.y + 40);
    line(location.x + 5, location.y+50, location.x + 15, location.y + 40);

    //body 
    fill(232, 176, 44);
    noStroke();
    ellipse(location.x, location.y, 70, 70);
    ellipse(location.x, location.y-40, 40, 50);

    //face
    fill(130, 74, 0);
    ellipse(location.x+10, location.y-50, 7, 7);
    ellipse(location.x-10, location.y-50, 7, 7);
    fill(255, 242, 0);
    triangle(location.x-5, location.y-40, location.x+5, location.y-40, location.x, location.y - 30);
  }

  void moveChicken() {

    if ((this.location.x > width - 75) || (this.location.x < 75)) {
      speed.x = speed.x *-1;
    }
    if ((this.location.y > height - 75) || (this.location.y < 75)) {
      speed.y = speed.y *-1;
    }

    println(speed.x + " | " + speed.y);
    location.add(speed);
  }
}
