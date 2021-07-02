/*
State 3: thermometer.
 this state "thermometer" defines one of the five states
 in this state you can cool the temperature or leave it hot. In case you let the temperature drop, you will go to state 4 (snowflakes). Otherwise you will go back to state 2, the sun.
 */
class State3 extends Screen {
  int level = -250;
  boolean rising = false;
  PImage kwik;
  State3(ScreenState[] nextStates) {
    super(nextStates);
    // reference: image of a thermometer, seekclipart.com, accessed the 17th of June 2019, https://www.seekclipart.com/clipart/xxmJxw_thermometer-hot-heat-summer-comments-celsius-degree-png/
    kwik = loadImage("kwik.png");
  }

  void draw() {
    background (0, 0, 255);
    pushStyle();
    fill(255, 0, 0, 255);
    imageMode(CENTER);
    ellipseMode(CENTER);
    rect(width/2-25, height/2+80, 60, level); // the temperature of the thermometer
    ellipse(width/2, height/2+130, 120, 120); // the base 
    image(kwik, width/2, height/2, 400, 400);
    text("Click very fast on the 'down' arrow key, to lower the temperature!", 20, 20);

    popStyle();

    if (rising==true) {
      if (level>0) {
        goToState(nextStates[0]);
        rising = false;
        level = -250;
      } else if (level<-250) {
        goToState(nextStates[1]);
        rising = false;
        level = -250;
      }
      level--;
    }
  }

  void reset() {
    // empty
  }

  void handleKeyPress() {
    // the "down" key lowers the level of the temperature, otherwise, go back up
    if (key==CODED) {
      if (keyCode == DOWN) {
        level +=10;
        rising = true;
      }
    }
  }
}
