void setup(){
  size(800,800);
  background(255);
  strokeWeight(1);
  stroke(1, 50);
  
  drawNet();
}

float min = 1000;
float max = -1;

void drawNet(){
  float seedX = random(10);
  float seedY = random(10);
  float initSeed = seedY;
  for(int x = 0; x < 800; x+= 5){
    seedX += 0.1;
    seedY = initSeed;
    for(int y = 0; y < 800; y+= 5){
      seedY += 0.1;
      float noiseVal = noise(seedY, seedX);
      if (noiseVal < min)
        min = noiseVal;
       if (noiseVal > max)
         max = noiseVal;
      //drawSquare(x,y, noiseVal);
      //drawCircle(x,y, noiseVal);
      colorMode(HSB, 100);
      drawLine(x, y, noiseVal);
    }
  }
  println(min);
  println(max);
}

void drawSquare(int x, int y, float noiseVal){
  rect(x,y, noiseVal*10, noiseVal*10);
}

void drawCircle(int x, int y, float noiseVal){
  strokeWeight(1);
  circle(x,y, noiseVal*20);
}

void drawLine(int x, int y, float noiseVal){
   stroke(120*noiseVal, 50,50);
    pushMatrix();
  translate(x, y);
  rotate(noiseVal*radians(800));
  line(0,0, 20, 0);
  popMatrix();
}
