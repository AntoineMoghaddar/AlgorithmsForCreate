/*
 Black Assignment 1 Topic 7
 
 This program is called a statemachine. It changes of state, when a certain condition is fullfilled. 
 
 This particular program is a weather station: it changes from a sunny day, to rain and snow. However, they do depend on the thermometer: if you do not do anything, it will stay warm. But, when you are quick enough, the temperature 

 Reference: example of a state machine schema, Angelika Mader & David Stritzl, April 2017, accessed the 11th of June 2019; the fundamental blocks of this program have been used and left untouched. The states have been adjusted to our wishes.
 Reference2: code from module 2 of snowflakes, accessed the 17th of June 2019, Stijn Teekens and Armein Dul 
 
 Date: 30-04-2019
 Collaborators: Stijn Teekens (s2133350) & Armein Dul (s2164736)
 Algorithms for CreaTe
 University of Twente

*/
import java.util.*;

import processing.sound.*;
SoundFile straal;
ScreenStateMachine stateMachine;

void setup() {
  size(500, 500);
  straal = new SoundFile(this, "zonnestralen.mp3");
  Map<ScreenState, Screen> screens = new HashMap<ScreenState, Screen>();

  // the following sets up the structure of the state machine in the game
  // first, it matches the names of the ScreenStates to the instances of the game phase
  // second, it defines the list of successor screens for each screen (game phase)

  screens.put(ScreenState.STATE_1, new State1(new ScreenState[] {ScreenState.STATE_2})); // geeft de overgang weer van bijvoorbeeld state 0 naar state 2 in deze regel 
  screens.put(ScreenState.STATE_2, new State2(new ScreenState[] {ScreenState.STATE_3}));
  screens.put(ScreenState.STATE_3, new State3(new ScreenState[] {ScreenState.STATE_4, ScreenState.STATE_2})); 
  screens.put(ScreenState.STATE_4, new State4(new ScreenState[] {ScreenState.STATE_5, ScreenState.STATE_3}));
  screens.put(ScreenState.STATE_5, new State5(new ScreenState[] {ScreenState.STATE_1}));



  // The current state machine changes as the program progresses. However, it starts at state 1.
  stateMachine = new ScreenStateMachine(screens, ScreenState.STATE_1);
}

void draw() {
  stateMachine.doAvailableTransitions();
  stateMachine.drawScreen();
}

void keyPressed() {
  stateMachine.handleKeyPress();
}

void mousePressed() {
  stateMachine.handleMousePress();
}
