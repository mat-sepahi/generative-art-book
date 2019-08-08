
void setup(){
  size(800,800);
  background(1);
  smooth();
  
  drawNet();
}

void drawNet(){
  float seedX = random(10);
  float seedY = random(10);
  float initSeed = seedY;
  for(int x = 0; x < 800; x+= 5){
    seedX += 0.1;
    seedY = initSeed;
    for(int y = 0; y < 800; y+= 5){
      seedY += 0.1;
      float noiseVal = noise(seedX, seedY);
      drawPoint(x,y, noiseVal);
    }
  }
}

void drawPoint(int x, int y, float noiseVal){
  pushMatrix();
translate(x,y);
rotate(noiseVal * radians(540));
float edgeSize = noiseVal * 35;
float grey = 150 + (noiseVal * 120);
float alph = 150 + (noiseVal * 120);
noStroke();
fill(grey, alph);
ellipse(0,0, edgeSize, edgeSize/2);
popMatrix();

}
