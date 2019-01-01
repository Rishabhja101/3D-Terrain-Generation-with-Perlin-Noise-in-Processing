int cols, rows;
int scale = 20;
int w = 2000;
int h = 1500;
float[][] terrain;
  
void setup() {
  size(2000, 1500, P3D);
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
      xoff += 0.1;
    }
    yoff += 0.1;
  }  
}

void draw() {
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
