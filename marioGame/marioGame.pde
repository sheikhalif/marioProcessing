import java.util.*;
import java.lang.*;

Character mario = new Character();
Platform grassPlatform = new Platform();
int speed = mario.speed;
ArrayList<Environment> obstacles = new ArrayList<Environment>();
ArrayList<backgroundItems> backgroundObjects = new ArrayList<backgroundItems>();
int backgroundObjectStartX = 600;
float scale = 1;
PImage marioSkin1;
  
Background theBackground = new Background();
boolean[] keys = new boolean[]{false, false};


void setup(){
  size(1920,1080);
  marioSkin1 = loadImage("marioskin1.png");
  obstacles.add(new killerBird());
  Spike spike1 = new Spike(600);
  obstacles.add(spike1);
  spikedBall spikedBall1 = new spikedBall(1800);
  obstacles.add(spikedBall1);
  obstacles.add(new Pitfall(2500));
  //obstacles.add(new poisonTrap(3200));
  //obstacles.add(new Spike(3900));
  //obstacles.add(new Spike(4600));
  //obstacles.add(new spikedBall(6000));
  obstacles.add(new doubleJump(3500));
  obstacles.add(new poisonTrap(4000));
  for (int i = 0; i < 100; i++){
    int rng1 = (int)(Math.random() * 2);
    int rng2 = 700 + (int)(Math.random() * 201);
    backgroundObjects.add(new Cloud(backgroundObjectStartX+10));
    if (rng1 == 0){
      backgroundObjects.add(new Rock(backgroundObjectStartX));
    }
    else if (rng1 == 1){
      backgroundObjects.add(new Tree(backgroundObjectStartX));
    }
    backgroundObjectStartX+=rng2;
  }
}

void keyPressed(){
  if (keyCode == 68){
    keys[0] = true;
  }
  if (keyCode == 65){
    keys[1] = true;
  }
  if (keyCode == 32){
    mario.jump();
    mario.jumpStart = mario.yval;
  }
}

void keyReleased(){
  if (keyCode == 68){
    keys[0] = false;
  }
  if (keyCode == 65){
    keys[1] = false;
  }
}

void draw(){
  if (mario.paranoiaCountdown > 0){
    speed = 8;
    scale(scale);
    if (scale < 1.5){
      scale = scale*1.02;
    }
    translate(0, -200*scale);
    mario.paranoiaCountdown--;
    if (mario.paranoiaCountdown == 0){
      scale = 1;
      speed = mario.speed;
    }
  }
  if (mario.doubleJumpCountdown > 0){
    mario.doubleJumpCountdown--;
  }
  theBackground.display();
  for(int i = 0; i < backgroundObjects.size(); i++){
    backgroundObjects.get(i).display();
  }
  String lives = "Lives: " + mario.lives;
  mario.display();
  mario.move();
  grassPlatform.display();
  for(int i = 0; i < obstacles.size(); i++){
    if (obstacles.get(i).x < 2500){
      obstacles.get(i).display();
      obstacles.get(i).check();
    }
    
  }
  if (keys[0]){
    for (int i = 0; i < obstacles.size(); i++){
      Environment currentObstacle = obstacles.get(i);
      if (currentObstacle.x < -150){
        obstacles.remove(currentObstacle);
      }
      else{
        currentObstacle.move();
      }
    }
    for (int i = 0; i < backgroundObjects.size(); i++){
      backgroundObjects.get(i).move();
      if (backgroundObjects.get(i).x < -300){
        backgroundObjects.remove(i);
      }
    }
  }

  fill(0);
  textSize(50);
  if (mario.paranoiaCountdown == 0){
    text (lives, 20, 50);
    if (mario.doubleJumpCountdown > 0){
      fill(154, 70, 224);
      String doubleJumpCountdownText = "Double Jump: " + ((mario.doubleJumpCountdown/60) + 1) + " seconds";
      textSize(30);
      text(doubleJumpCountdownText, 20, 90);
    }
  }
  else{
    textSize(35);
    fill(0);
    text(lives, 20, 350);
    fill(124, 118, 129);
    String paranoiaCountdownText = "Paranoia: " + ((mario.paranoiaCountdown/60)+1) + " seconds";
    textSize(25);
    text(paranoiaCountdownText, 20, 380);
    if (mario.doubleJumpCountdown > 0){
      fill(154, 70, 224);
      String doubleJumpCountdownText = "Double Jump: " + ((mario.doubleJumpCountdown/60) + 1) + " seconds";
      text(doubleJumpCountdownText, 20, 410);
    }
  }
}
