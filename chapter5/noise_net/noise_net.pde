void setup(){
  size(800,800);
  background(255);
  strokeWeight(1);
  fill(255, 0);
  stroke(1);
  
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
      drawSquare(x,y, noiseVal);
      drawCircle(x,y, noiseVal);
    }
  }
}

void drawSquare(int x, int y, float noiseVal){
  rect(x,y, noiseVal*10, noiseVal*10);
}

void drawCircle(int x, int y, float noiseVal){
  strokeWeight(1);
  circle(x,y, noiseVal*20);
}
