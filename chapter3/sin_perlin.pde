size(800, 600);
background(150);
strokeWeight(2);
stroke(0);
smooth();

boolean started = false;
int base = 50;
int prevX = 0;
float prevY = 0;
for(int x = 0; x < width; x++){
    float rad = radians(x);
    float y = sin(rad)*50;
  if (started){
    line(prevX, prevY + base, x, y + base);
  }
  started = true;
  prevX = x; 
  prevY = y;
}

started = false;
base = 150;
prevX = 0;
prevY = 0;
for(int x = 0; x < width; x++){
    float rad = radians(x);
    float y = sin(rad)*50 * noise(rad);
  if (started){
    line(prevX, prevY + base, x, y + base);
  }
  started = true;
  prevX = x; 
  prevY = y;
}

started = false;
base = 250;
prevX = 0;
prevY = 0;
for(int x = 0; x < width; x++){
    float rad = radians(x);
    float y = pow(sin(rad), 3)*50;
  if (started){
    line(prevX, prevY + base, x, y + base);
  }
  started = true;
  prevX = x; 
  prevY = y;
}

started = false;
base = 350;
prevX = 0;
prevY = 0;
for(int x = 0; x < width; x++){
    float rad = radians(x);
    float y = pow(sin(rad), 3)*50*noise(rad);
  if (started){
    line(prevX, prevY + base, x, y + base);
  }
  started = true;
  prevX = x; 
  prevY = y;
}


started = false;
base = 450;
prevX = 0;
prevY = 0;
for(int x = 0; x < width; x++){
    float rad = radians(x);
    float y = 50*noise(rad);
  if (started){
    line(prevX, prevY + base, x, y + base);
  }
  started = true;
  prevX = x; 
  prevY = y;
}

started = false;
base = 550;
prevX = 0;
prevY = 0;
for(int x = 0; x < width; x++){
    float rad = radians(x);
    float y = 50*noise(rad*10);
  if (started){
    line(prevX, prevY + base, x, y + base);
  }
  println(rad);
  started = true;
  prevX = x; 
  prevY = y;
}
