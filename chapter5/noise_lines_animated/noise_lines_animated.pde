float varSeedX, varSeedY, initSeedX, initSeedY;

void setup(){
  size(300,300);
  smooth();
 varSeedX = random(20);
 varSeedY = random(20);
 initSeedX = random(10);
 initSeedY = random(10);
 frameRate(24);
}

void draw(){
  colorMode(RGB, 255);
  background(200);
  varSeedX += 0.01;
  varSeedY += 0.01;
  initSeedX += noise(varSeedX)* 0.5 - 0.25 ;
  initSeedY += noise(varSeedY) * 0.5 - 0.25;
  float seedX = initSeedX;
  float seedY = initSeedY;
  float initSeed = initSeedY;
  for(int x = 0; x < width; x+= 5){
    seedX += 0.1;
    seedY = initSeed;
    for(int y = 0; y < height; y+= 5){
      seedY += 0.1;
      float noiseVal = noise(seedY, seedX);
      //drawSquare(x,y, noiseVal);
      //drawCircle(x,y, noiseVal);
      drawLine(x, y, noiseVal);
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

void drawLine(int x, int y, float noiseVal){
  colorMode(HSB, 100);
   stroke(120*noiseVal, 50,50);
    pushMatrix();
  translate(x, y);
  rotate(noiseVal*radians(350));
  line(0,0, 20, 0);
  popMatrix2();
}
