import java.util.*;
import java.lang.*;

Character mario = new Character();
Platform grassPlatform = new Platform();
int speed = mario.speed;
ArrayList<Environment> obstacles = new ArrayList<Environment>();
ArrayList<backgroundItems> backgroundObjects = new ArrayList<backgroundItems>();
int backgroundObjectStartX = 600;
float scale = 1;
boolean inMenu = true;
int menu = 0;  
int level = -1;
PImage marioSkin1;
PImage marioMenuText;
  
Background theBackground = new Background();
boolean[] keys = new boolean[]{false, false};


void setup(){
  size(1920,1080);
  marioSkin1 = loadImage("marioskin1.png");
  marioMenuText = loadImage("mariomenutext.png");
  if (!(inMenu)){
    for (int i = 0; i < 1000; i++){
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
    if (level == 0){
      obstacles.add(new killerBird());
      obstacles.add(new Invincibility(400));
      obstacles.add(new Spike(600));
      obstacles.add(new spikedBall(1800));
      obstacles.add(new Pitfall(2500));
      obstacles.add(new doubleJump(3500));
      obstacles.add(new poisonTrap(4000));
    }
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
  background(255);
  if (inMenu){
    if (menu == 0){
      Platform menuPlatform = new Platform();
      menuPlatform.display();
      image(marioMenuText, 350, 0);
    }
  }
    
  else if (!(inMenu)){
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
  if (mario.invincibilityCountdown > 0){
    mario.invincibilityCountdown--;
    if (mario.invincibilityCountdown <= 10){
      speed = 15;
    }
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
      if (mario.invincibilityCountdown == 0){
        obstacles.get(i).check();
      }
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
  String paranoiaCountdownText = "Paranoia: " + ((mario.paranoiaCountdown/60)+1) + " seconds";
  String doubleJumpCountdownText = "Double Jump: " + ((mario.doubleJumpCountdown/60) + 1) + " seconds";
  String invincibilityCountdownText = "Invincibility: " + ((mario.invincibilityCountdown/60)+1) + " seconds";
  if (mario.paranoiaCountdown == 0){
    text (lives, 20, 50);
    textSize(30);
    if (mario.doubleJumpCountdown > 0){
      fill(154, 70, 224);
      text(doubleJumpCountdownText, 20, 90);
      if (mario.invincibilityCountdown > 0){
        fill(85, 171, 234);
        text(invincibilityCountdownText, 20, 130);
      }
    }
    
    else if (mario.invincibilityCountdown > 0){
      fill(85, 171, 234);
      text(invincibilityCountdownText, 20, 90);
      if (mario.doubleJumpCountdown > 0){
        fill(154, 70, 224);
        text(doubleJumpCountdownText, 20, 130);
      }
    }
  }
  else{
    textSize(35);
    fill(0);
    text(lives, 20, 350);
    fill(124, 118, 129);
    textSize(25);
    text(paranoiaCountdownText, 20, 380);
    if (mario.doubleJumpCountdown > 0){
      fill(154, 70, 224);
      text(doubleJumpCountdownText, 20, 410);
      if (mario.invincibilityCountdown > 0){
        fill(85, 171, 234);
        text(invincibilityCountdownText, 20, 440);
      }
    }
    else if (mario.invincibilityCountdown > 0){
      fill(85, 171, 234);
      text(invincibilityCountdownText, 20, 410);
      if (mario.doubleJumpCountdown > 0){
        fill(154, 70, 224);
        text(doubleJumpCountdownText, 20, 440);
      }
    }
  }
  }
}
