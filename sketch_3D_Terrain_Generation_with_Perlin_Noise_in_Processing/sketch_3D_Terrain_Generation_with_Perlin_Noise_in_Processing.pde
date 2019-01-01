int cols, rows;
int scale = 20;
int w = 9000;
int h = 5000;
float speed = 0;
float[][] terrain;
  
void setup() {
  size(3000, 1500, P3D);
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
  
}

void draw() {
  speed -= 0.4;
  float yoff = speed;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -150, 150);
      xoff += 0.10;
    }
    yoff += 0.10;
  }  
  
  background(0); 
  stroke(255);
  fill(50);
  //noFill();
  
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
