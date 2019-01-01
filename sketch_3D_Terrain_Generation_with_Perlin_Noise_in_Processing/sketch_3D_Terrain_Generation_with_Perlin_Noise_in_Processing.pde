int cols, rows;
int scale = 20;
int w = 4000;
int h = 3000;
float speed = 0;
float[][] terrain;
  
void setup() {
  size(2000, 1500, P3D);
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
  
}

void draw() {
  speed -= 0.05;
  float yoff = speed;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.15;
    }
    yoff += 0.15;
  }  
  
  background(0); 
  stroke(255);
  noFill();
  
  translate(width / 2, height / 2);
  rotateX(PI / 3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y + 1) * scale, terrain[x][y + 1]);
    }
    endShape();
  }   
}
