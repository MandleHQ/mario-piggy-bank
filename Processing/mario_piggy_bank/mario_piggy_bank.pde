import processing.serial.*;
import ddf.minim.*;

Serial myPort;
Minim minim;
AudioPlayer sound;
int imageCount = 5;
PImage[] images = new PImage[imageCount];
int frame = 0;

void setup(){
  minim = new Minim(this);
  sound = minim.loadFile("coin.wav");
  for(int i = 0; i < imageCount ; i++){
    images[i] = loadImage("mario_" + nf(i, 2) + ".jpg");
  }
  
  size(images[0].width, images[0].height);
  frameRate(30);
  
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw(){
  background(images[frame]);
  
  if(frame != 0){
    ++frame;
    if(frame == 5)
      frame = 0;  
  }
  
  if(myPort.available()>0){
    String val = myPort.readStringUntil('\n');
    if(val != null){
      val = trim(val);
      if(Double.parseDouble(val) == 1){ 
        if(!sound.isPlaying()){
            sound.rewind();
            sound.play();
            frame = 1;
        }
      }
    } 
  }
}
