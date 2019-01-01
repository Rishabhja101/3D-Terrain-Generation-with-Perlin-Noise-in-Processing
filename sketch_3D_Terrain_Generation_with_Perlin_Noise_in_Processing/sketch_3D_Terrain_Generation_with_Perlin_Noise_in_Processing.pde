int cols, rows;
int scale = 20;
int w = 600;
int h = 600;
  
float[][] terrain;
  
void setup() {
  size(600, 600, P3D);
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
}

void draw() {
   background(0); 
   stroke(255);
   noFill();
   
   translate(width / 2, height / 2);
   rotateX(PI / 3);
   translate(-w/2, -h/2);
   for (int y = 0; y < rows; y++) {
     beginShape(TRIANGLE_STRIP);
     for (int x = 0; x < cols; x++) {
       vertex(x * scale, y * scale, random(-10, 10));
       vertex(x * scale, (y + 1) * scale, random(-10, 10));
     }
     endShape();
   }   
}
