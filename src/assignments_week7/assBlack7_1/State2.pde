/*
State 2: sun.
 this state "sun" defines one of the five states
 this class creates a scene of a sunny day; if you press the house, the sun will start shining bright. Moreover, the song "het regent zonnestralen" will start playing.
 
 */

class State2 extends Screen {

  float angle = -60;
  float  angleMoving = 0;
  boolean rotating = false;
  boolean housePressed = false;
  float houseX, houseY;
  PImage house;
  State2(ScreenState[] nextStates) {
    super(nextStates);
    houseX = width/2;
    houseY = height - 100;
    //  Reference:   image of house, pixabay.com, accessed the 14th of June 2019, https://pixabay.com/illustrations/home-house-icon-architecture-4052994/
    house = loadImage("house.png");
  }

  void draw() {
    background (0, 255, 0);
    if (housePressed == true) {
      if (rotating == false) {
        angle = -PI/3;
        rotating = true;
        straal.play(); // start playing the music and play as long as it is rotating
      } else {
        angle += 0.004;
      }

      // draw the sun

      pushMatrix();
      pushStyle();
      translate(width/2, height);
      rotate(angle);
      noStroke();
      fill(#F9FA0D);
      ellipse (0, -400, 75, 75); // the base of the sun

      noFill();
      stroke(0);
      // draw the eyes

      ellipse(-10, -410, 10, 10);
      ellipse(10, -410, 10, 10 );
      arc(0, -400, 40, 50, 0, PI, OPEN );// draw the mouth


      // create the beams of the sun

      translate(0, -400);
      int total = 30;
      for (int i=0; i < total; i++) {
        float angle2 = (2*PI) / total;
        fill(#F9FA0D);
        noStroke();
        rect (35, 0, 50, 2);
        rotate(angle2);
      }

      popMatrix();
      reset();
      if (angle>PI/3) {
        angle=-PI/3;
        goToState(nextStates[0]);
        straal.stop();
        housePressed = false;
      }
    }
    textSize(15);
    fill(0);
    text("Click on the house to let it shine!", width/3, height/2);
    pushStyle();
    imageMode(CENTER);
    image(house, houseX, houseY, 200, 200);
    popStyle();
  }

  void reset() {
    if (angle>PI/3) { // check if the sun is gone at the right side of the screen
      angle=-PI/3;
      goToState(nextStates[0]); 
      straal.pause();
      housePressed = false;
      rotating = false;
    }
  }

  // this method checks if the mouse is within the range of the picture

  void handleMousePress() {

    if (dist(mouseX, mouseY, houseX, houseY)< 100) {
      housePressed =  true;
    }
  }
}
