size(600, 400);
int margin = 20;
background(150);
stroke(1);
line(margin, 200, 600-margin, 200);
stroke(3);

/*
float[] seed = new float[10];
for (int i = 0; i < 10; i++)
  seed[i] = random(10);
  */
float seed = random(10);
float prevX = 0, prevY[] = new float[10];
float[] y = new float[10];
float[] v = new float[10];

for (int i = 0; i < 10; i++){
  boolean started = false;

  for(int x = 0; x < 600; x+= 5){
      v[i] =  noise(seed) * 100;
      y[i] = v[i];
    if (started){
      line(prevX, prevY[i], x, y[i]);
    }
    started = true;
    prevX = x;
    prevY[i] = y[i];
    seed += 0.1;
    }
}
