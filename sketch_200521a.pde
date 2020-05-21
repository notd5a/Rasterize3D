PImage img;

void setup(){ 
  size(1000, 900, P3D);
  img = loadImage("statue.jpg");
  img.resize(1000, 0);
}

void draw(){ 
  background(#f1f1f1); // gray bg color
  fill(0);
  noStroke();
  sphereDetail(3);
  
  float tiles = 1000;
  float tileSize = width / tiles;
  
  push();
  translate(width / 2, height / 2);
  rotateY(radians(frameCount));
  
  for (int x = 0; x < tiles; x++) { 
    for(int y = 0; y < tiles; y++) {
       color c = img.get(int(x*tileSize), int(y*tileSize));
       float b = map(brightness(c), 0, 255, 1, 0);
       
       float z = map(b, 0, 1, -100, 100);
       
       push();
       translate(x*tileSize - width / 2, y*tileSize - height / 2, z);
       sphere(tileSize*b*0.8);
       pop();
     }
  }
  saveFrame("output/statue_####.png");
  pop();
  
}
