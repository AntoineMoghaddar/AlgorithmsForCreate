/*
State 5: rainbow.
 this state "rainbow" defines one of the five states
 in this state you will see a rainbow with an awarding message. 
 */
class State5 extends Screen {
  int timer;
  float part;
  State5(ScreenState[] nextStates) {
    super(nextStates);
    part = 1;
  }

  void draw() {
    background(146, 220, 252);
    pushStyle();
    fill(0);

    //rainbow
    translate(width/2, height);
    textSize(64);  
    text("WELL DONE!", -180, -400);
    noStroke();
    fill(255, 0, 0);
    arc(0, 0, 370, 370, PI, PI*2, CHORD);
    fill(255, 175, 71);
    arc(0, 0, 350, 350, PI, PI*2, CHORD);
    fill(249, 230, 54);
    arc(0, 0, 330, 330, PI, PI*2, CHORD);
    fill(133, 255, 109);
    arc(0, 0, 310, 310, PI, PI*2, CHORD);
    fill(129, 201, 239);
    arc(0, 0, 290, 290, PI, PI*2, CHORD);
    fill(106, 108, 237);
    arc(0, 0, 270, 270, PI, PI*2, CHORD);
    fill(232, 111, 230);
    arc(0, 0, 250, 250, PI, PI*2, CHORD);
    fill(146, 220, 252);
    arc(0, 0, 230, 230, PI, PI*2, CHORD);


    fill(146, 220, 252);
    arc(0, 0, 1500, 1500, part*PI, PI*2, PIE);
    part +=0.005;
    popStyle();

    if ((millis() - timer) > TIME_GAME_5) { 
      goToState(nextStates[0]);
      timer = millis();
      part = 1;
    }
  }

  void reset() {
    timer = millis();
  }


}
