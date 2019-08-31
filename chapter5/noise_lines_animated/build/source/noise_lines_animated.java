import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class noise_lines_animated extends PApplet {

float varSeedX, varSeedY, initSeedX, initSeedY;

public void setup(){
  
  
 varSeedX = random(20);
 varSeedY = random(20);
 initSeedX = random(10);
 initSeedY = random(10);
 frameRate(24);
}

public void draw(){
  colorMode(RGB, 255);
  background(200);
  varSeedX += 0.01f;
  varSeedY += 0.01f;
  initSeedX += noise(varSeedX)* 0.5f - 0.25f ;
  initSeedY += noise(varSeedY) * 0.5f - 0.25f;
  float seedX = initSeedX;
  float seedY = initSeedY;
  float initSeed = initSeedY;
  for(int x = 0; x < width; x+= 5){
    seedX += 0.1f;
    seedY = initSeed;
    for(int y = 0; y < height; y+= 5){
      seedY += 0.1f;
      float noiseVal = noise(seedY, seedX);
      //drawSquare(x,y, noiseVal);
      //drawCircle(x,y, noiseVal);
      drawLine(x, y, noiseVal);
    }
  }
}

public void drawSquare(int x, int y, float noiseVal){
  rect(x,y, noiseVal*10, noiseVal*10);
}

public void drawCircle(int x, int y, float noiseVal){
  strokeWeight(1);
  circle(x,y, noiseVal*20);
}

public void drawLine(int x, int y, float noiseVal){
  colorMode(HSB, 100);
   stroke(120*noiseVal, 50,50);
    pushMatrix();
  translate(x, y);
  rotate(noiseVal*radians(350));
  line(0,0, 20, 0);
  popMatrix2();
}
  public void settings() {  size(300,300);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "noise_lines_animated" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
