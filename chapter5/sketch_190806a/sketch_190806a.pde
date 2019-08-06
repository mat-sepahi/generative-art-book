size(800, 800);
background(255);
smooth();

float seedY = random(10), seedX = random(10);
float initSeedY = seedY;

void noiseGrid(){
  for (int x = 0; x < width; x++){
    seedY = initSeedY;
    seedX += 0.01;
    for (int y = 0; y < height; y++){
      seedY += 0.01;
      stroke(0, noise(seedY, seedX)*255);
      line(x,y, x+1, y+1);
    }
  }
}

void noiseStrips() {
  strokeWeight(2);
  for (int x = 0; x < width; x++){
    //seedY = initSeedY;
    seedX += 0.01;
    noise(seedX);
    for (int y = 0; y < height; y++){
      seedY += 0.01;
     stroke(50, (noise(seedY) + noise(seedX))*100);
      line(x,y, x+1, y+1);
    }
  }
}


void noiseCheckerBoard(){
  for (int x = 0; x < width; x++){
    seedY = initSeedY;
    seedX += 0.01;
    for (int y = 0; y < height; y++){
      seedY += 0.01;
     stroke(0, (noise(seedY) + noise(seedX))*120);
      line(x,y, x+1, y+1);
    }
  }
}
