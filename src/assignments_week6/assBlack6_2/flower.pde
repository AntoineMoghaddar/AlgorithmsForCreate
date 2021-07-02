//This class takes care of the flower that will be pulled back and forth. Eventually it will come to a stop
class Flower {
  int parts =5;
  float posX, posY;
  float frictionForce = 0;
  float frictionConstant = 0.3; 
  float springConstant = 100;
  int mass = 5;
  MSD[] system; // create an array of mass - spring - damper systems to be able to part a line into multiple segments

  Flower() {
    // add one part to the array, as the first will become the beginning point of the stem of the flower
    system = new MSD[parts]; 
    posX = width/2;
    posY = height;

    for (int i = 0; i<system.length; i++) {
      system[i] = new MSD(frictionForce, frictionConstant, springConstant, mass);
    }
  }

  void update() {
    println(system.length);
    float angle = 0;
    pushMatrix();
    translate (posX, posY);

    float velocity = 0;
    float force = 0;

    for (int i = 0; i < system.length; i++) {
      if (parts>1) {
        if (i > 0 && i<system.length-1) {
          system[i].calculate(system[i-1].velocity, system[i+1].frictionForce); // get the velocity of the segment below and force from the one above
        } else if (i==0) {
          system[i].calculate(0, system[i+1].frictionForce);
        } else if (i==system.length-1) {
          system[i].calculate(system[i-1].velocity, 0);
        }
      } else {
        system[i].calculate(velocity, force);
      }
      angle = system[i].angle;// get the angle of the segment

      stroke(0, 255, 0);
      strokeWeight(parts-i);
      rotate(radians(angle));
      line(0, 0, 0, -100); // depending on the segment and the previous segment, create a stem of mass - spring - damper systems

      translate(0, -100); // the beginning position of the stem
    }
    pushMatrix();
    translate(-145, -175);//moves the flower into position
    leaf();
    popMatrix();
    popMatrix();
  }

  void leaf() {
    pushMatrix();
    beginShape();
    scale(3);
    stroke(0);
    fill(255, 0, 0);
    vertex(87, 46);
    bezierVertex(72, 65, 74, 70, 45, 79);
    bezierVertex(42, 78, 15, 59, 87, 46);
    endShape();

    beginShape();
    vertex(12, 46);
    bezierVertex(13, 84, 55, 78, 52, 77);
    bezierVertex(33, 64, 50, 56, 12, 46);
    endShape();

    beginShape();
    vertex(50, 30);
    bezierVertex(60, 51, 64, 79, 45, 79);
    bezierVertex(39, 78, 28, 64, 50, 30);
    endShape();

    popMatrix();
  }
}
