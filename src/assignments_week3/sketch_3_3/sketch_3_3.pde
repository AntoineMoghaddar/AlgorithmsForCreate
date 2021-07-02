Rain rain;

void setup() {
  size(500,500);
  rain = new Rain(600);
}

void draw() {
 fill(200,96);
 rect(0,0,width,height);
 
 rain.update();
 rain.render();
}
