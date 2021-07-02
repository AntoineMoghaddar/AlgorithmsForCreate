//This class takes care of the line that will be pulled back and forth. Eventually it will come to a stop
class Stick {
  MSD system; 

  Stick() {
    system = new MSD(0); // the ability to apply an intial velocity to the system
  }

  void display() {
    system.calculate();
    translate(width/2, height/2); // put the line at the center of the screen
    rotate(radians(system.angle)-0.5*PI); // rotate 90 degrees to the left
    line(0, 0, width/2, height/2-400);
  }
}
