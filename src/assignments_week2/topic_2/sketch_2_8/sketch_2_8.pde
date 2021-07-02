float[][] grid;
float xi =0.0, yi=0.0, offset;

void setup() {
  size(1000, 1000, P3D);
  background(100);

  fill(50);
  stroke(255);
  grid = new float[100][100];
  frameRate(10);
}

void draw() {
  background(10);

  translate(200, 100);
  rotateX(PI/5);

  offset += 0.1;
  xi = 0;

  for (int i = 0; i < grid.length-1; i++) {
    yi = offset;
    for (int j = 0; j <grid[i].length-1; j++) {
      grid[i][j] = map(noise(xi, yi), 0, 1, -120, 120);
      yi+=0.2;
    }
    xi+=0.2;
  }

  //printing the grid
  for (int i = 0; i < grid.length-1; i++) {
    beginShape(QUAD_STRIP);
    for (int j = 0; j < grid[i].length-1; j++) {
      fill(255);
      stroke(0);
      vertex(8*i, j*8, grid[i][j]);
      vertex(8*i+8, 8*j, grid[i+1][j]);
    }
    endShape();
  }
}
