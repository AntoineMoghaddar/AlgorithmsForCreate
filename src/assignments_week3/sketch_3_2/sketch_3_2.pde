
Catapult c;

void setup() {
  size(600, 400);
  
  c = new Catapult();
}

void draw() {
  background(0);

  c.display();
  c.update();
}

void mouseDragged() { 
  c.mouseDraggedEvent(new PVector(mouseX, mouseY));
} 

void mouseReleased() { 
  c.mouseReleasedEvent();
}
