float yo = 0.0; //offsets

float yi = 0.001; //increments
float n1; //float for noise

float Xposition = 0; //starting position terrain
ArrayList<Rects> rs = new ArrayList<Rects>(); 

void setup() {
  size(1500, 500);
}

void draw() {
  noStroke();

  //terrain
  n1 = noise(yo)*height;
  yo += yi;

  fill(0, 150, 0);
  noStroke();

  Xposition += 0.5;
  rs.add(new Rects(width+Xposition, n1, 1, 300));

  for (Rects r : rs) {
    r.decreaseW();
    r.display();
  }

  //car
  fill(100);
  ellipse(width/2 + 30, 400, 30, 30);
  ellipse(width/2 + 90, 400, 30, 30);
  fill(255, 0, 0);
  rect(width/2, 360, 120, 30);
  rect(width/2, 330, 80, 50);

  //road
  fill(150);
  rect(0, 408, width, 200);
}
