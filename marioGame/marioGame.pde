import java.util.*;
import java.lang.*;

Character mario = new Character();
Platform grassPlatform = new Platform();
int speed = mario.speed;
ArrayList<Environment> tutorial = new ArrayList<Environment>();
ArrayList<backgroundItems> backgroundObjects = new ArrayList<backgroundItems>();
int backgroundObjectStartX = 600;
float scale = 1;
boolean inMenu = true;
int menu = 0;  
int level = -1;
PImage marioSkin1;
PImage marioMenuText;
PImage menuTutorialText;
PImage menuLevel1Text;
PImage menuLevel2Text;
PImage menuLockerText;
PImage platformSkin;
PImage currentSkin;
  
Background theBackground = new Background();
boolean[] keys = new boolean[]{false, false};


void setup(){
  size(1920,1080);
  marioSkin1 = loadImage("marioskin1.png");
  marioMenuText = loadImage("mariomenutext.png");
  menuTutorialText = loadImage("menututorial.png");
  menuLevel1Text = loadImage("menulevel1.png");
  menuLevel2Text = loadImage("menulevel2.png");
  menuLockerText = loadImage("menulocker.png");
  platformSkin = loadImage("mariobrickplatform.png");
  currentSkin = marioSkin1;
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
  
  for (int i = 0; i < 40; i++){
    backgroundObjects.add(new Platform(1920*i));
  }
  /**
  tutorial.add(new killerBird());
  tutorial.add(new Invincibility(400));
  tutorial.add(new Spike(600));
  tutorial.add(new spikedBall(1800));
  tutorial.add(new Pitfall(2500));
  tutorial.add(new doubleJump(3500));
  tutorial.add(new poisonTrap(4000));
  **/
  tutorial.add(new tutorialText(300, "Welcome to Mario! Move using 'd' and jump using 'space'"));
  tutorial.add(new Spike(1200));
  tutorial.add(new Spike(1800));
  tutorial.add(new tutorialText(2200, "There are three types of obstacles in this game: "));
  tutorial.add(new tutorialText(2600, "Spike"));
  tutorial.add(new Spike(2700));
  tutorial.add(new 
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

void mouseClicked(){
  if (mouseX >= 500 && mouseX <= 920 && mouseY >= 410 && mouseY <= 510){
    inMenu = false;
    level = 0;
  }
  if (mouseX >= 500 && mouseX <= 920 && mouseY >= 530 && mouseY <= 630){
    inMenu = false;
    level = 1;
  }
  if (mouseX >= 500 && mouseX <= 920 && mouseY >= 650 && mouseY <= 750){
    inMenu = false;
    level = 2;
  }
  if (mouseX >= 500 && mouseX <= 920 && mouseY >= 770 && mouseY <= 870){
    menu = 1;
  }
}

void draw(){
  background(255);
  if (inMenu){
    if (menu == 0){
      Platform menuPlatform = new Platform();
      menuPlatform.display();
      theBackground.display();
      image(marioMenuText, 350, 0);
      if (mouseX >= 500 && mouseX <= 920 && mouseY >= 410 && mouseY <= 510){
        fill(255);
        stroke(0);
        strokeWeight(3);
        rect(490, 400, 440, 120);
        noStroke();
      }

      fill(0);
      rect(500, 410, 420, 100);
      fill (141, 79, 58);
      rect(510, 420, 400, 80);
      image(menuTutorialText, 520, 430);
      
      if (mouseX >= 500 && mouseX <= 920 && mouseY >= 530 && mouseY <= 630){
        fill(255);
        stroke(0);
        strokeWeight(3);
        rect(490, 520, 440, 120);
        noStroke();
      }
      
      fill(0);
      rect(500, 530, 420, 100);
      fill (141, 79, 58);
      rect(510, 540, 400, 80);
      image(menuLevel1Text, 548, 550);
      
      if (mouseX >= 500 && mouseX <= 920 && mouseY >= 650 && mouseY <= 750){
        fill(255);
        stroke(0);
        strokeWeight(3);
        rect(490, 640, 440, 120);
        noStroke();
      }
      
      fill(0);
      rect(500, 650, 420, 100);
      fill (141, 79, 58);
      rect(510, 660, 400, 80);
      image(menuLevel2Text, 548, 670);
      
      if (mouseX >= 500 && mouseX <= 920 && mouseY >= 770 && mouseY <= 870){
        fill(255);
        stroke(0);
        strokeWeight(3);
        rect(490, 760, 440, 120);
        noStroke();
      }
      
      fill(0);
      rect(500, 770, 420, 100);
      fill (141, 79, 58);
      rect(510, 780, 400, 80);
      image(menuLockerText, 568, 790);
      
      scale(1.7);
      image(currentSkin, 650, 230);
    }
    if (menu == 1){
      Platform menuPlatform = new Platform();
      menuPlatform.display();
      theBackground.display();
      image(currentSkin, 300, 300);
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
    if (backgroundObjects.get(i).x < 2000){
      backgroundObjects.get(i).display();
    }
    if (backgroundObjects.get(i).x < -400){
      backgroundObjects.remove(backgroundObjects.get(i));
    }
    
  }
  String lives = "Lives: " + mario.lives;
  mario.display();
  mario.move();
  if (level == 0){
    for(int i = 0; i < tutorial.size(); i++){
      if (tutorial.get(i).x < 2500){
        tutorial.get(i).display();
        if (mario.invincibilityCountdown == 0){
          tutorial.get(i).check();
        }
      }
    }
    if (keys[0]){
      for (int i = 0; i < tutorial.size(); i++){
        if (tutorial.get(i).x < -150){
          tutorial.remove(tutorial.get(i));
        }
        else{
          tutorial.get(i).move();
        }
      }
    }
  
    
  }
  if (keys[0]){
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
