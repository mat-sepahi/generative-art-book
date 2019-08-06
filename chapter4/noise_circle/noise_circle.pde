size(600, 600);
background(100);

float prevX = 0;
float prevY = 0;
int centerX = 300;
int centerY = 300;

strokeWeight(1);
stroke(150);

for(int i = 0; i < 1000; i++){
  float rad = radians(i);
  float x = cos(rad) * i/4;
  float y = sin(rad) * i/4;
  if (i > 0){
    line(prevX+ centerX, prevY+centerY, x + centerX, y+centerY);
  }
  prevX = x;
  prevY = y;
  
}

float noise_seed = random(1);
strokeWeight(1);
stroke(0);
for(int i = 0; i < 1000; i++){
  float rad = radians(i);
  float x = cos(rad) * i/4 + noise(noise_seed) * 20 - 10;
  float y = sin(rad) * i/4 + noise(noise_seed + 0.1) * 20 - 10;
  if (i > 0){
    line(prevX+ centerX, prevY+centerY, x + centerX, y+centerY);
  }
  prevX = x;
  prevY = y;
  noise_seed += 0.1;
}

noise_seed = random(1);
strokeWeight(1);
stroke(0, 150, 150);
for(int i = 0; i < 1000; i++){
  float rad = radians(i);
  float x = cos(rad) * i/2 * noise(noise_seed);
  float y = sin(rad) * i/2 * noise(noise_seed + 0.1);
  if (i > 0){
    line(prevX+ centerX, prevY+centerY, x + centerX, y+centerY);
  }
  prevX = x;
  prevY = y;
  noise_seed += 0.1;
}
