import java.util.*;
import java.lang.*;

Character mario = new Character();
PFont marioFont;
Platform grassPlatform = new Platform();
int speed = mario.speed;
ArrayList<Environment> tutorial = new ArrayList<Environment>();
ArrayList<Environment> tutorialCopy = new ArrayList<Environment>();
ArrayList<backgroundItems> backgroundObjects = new ArrayList<backgroundItems>();
int backgroundObjectStartX = 600;
float scale = 1;
boolean inMenu = true;
int menu = 0;  
int level = -1;
boolean levelCompleted = false;
color hoverColor = color(0, 0, 0);
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
  marioFont = createFont("super_mario_rpg_font.ttf", 150);
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
  }
  

void setTutorial(){
  tutorial.clear();
  tutorial.add(new tutorialText(300, "Welcome to Mario! Move using 'd' and jump using 'space'"));
  tutorial.add(new Spike(1200));
  tutorial.add(new Spike(1800));
  tutorial.add(new tutorialText(2900, "There are three types of obstacles in this game: "));
  tutorial.add(new tutorialText(5090, "Spikes"));
  tutorial.add(new Spike(5120));
  tutorial.add(new tutorialText(6000, "Spiked Balls"));
  tutorial.add(new spikedBall(7000));
  tutorial.add(new tutorialText(7500, "and Killer Birds. Watch out!"));
  tutorial.add(new killerBird(2000));
  tutorial.add(new tutorialText(14000, "There are two types of traps:"));
  tutorial.add(new tutorialText(15500, "Poison Traps. Jump on it to see what happens!"));
  tutorial.add(new poisonTrap(16800));
  tutorial.add(new Spike(17700));
  tutorial.add(new Spike(18200));
  tutorial.add(new spikedBall(19400));
  tutorial.add(new Spike(19900));
  tutorial.add(new Spike(20500));
  tutorial.add(new Spike(21000));
  tutorial.add(new tutorialText(22800, "and Pitfalls. Don't jump!"));
  tutorial.add(new Pitfall(23800));
  tutorial.add(new tutorialText(24800, "Lastly, there are two power-ups:"));
  tutorial.add(new tutorialText(26000, "Double Jump"));
  tutorial.add(new doubleJump(27000));
  tutorial.add(new Spike(27700));
  tutorial.add(new Spike(27800));
  tutorial.add(new Spike(27900));
  tutorial.add(new Spike(28000));
  tutorial.add(new Spike(28100));
  tutorial.add(new Spike(28200));
  tutorial.add(new Spike(28300));
  tutorial.add(new spikedBall(28900));
  tutorial.add(new spikedBall(29100));
  tutorial.add(new spikedBall(29300));
  tutorial.add(new killerBird(24000));
  tutorial.add(new killerBird (24100));
  tutorial.add(new killerBird(24200));
  tutorial.add(new killerBird(24300));
  tutorial.add(new killerBird(24400));
  tutorial.add(new tutorialText(37500, "and invincibility. Run!!"));
  tutorial.add(new Invincibility(38900));
  for (int i = 0; i < 170; i++){
    tutorial.add(new Spike(39400+(100*i)));
  }
  tutorial.add(new tutorialText(57500, "And that's the game! Check out infinite mode in the locker to unlock new skins for Mario!"));
  tutorial.add(new Flag(61000));
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
  if (keyCode == 75 && !(inMenu)){
    levelCompleted = true;
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
  if (inMenu && menu == 0){
    if (mouseX >= 500 && mouseX <= 920 && mouseY >= 410 && mouseY <= 510){
    inMenu = false;
    level = 0;
    setTutorial();
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
  if (mario.dead && level == 0){
    if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 450 && mouseY <= 550){
      setTutorial();
      mario.lives = 3;
      mario.dead = false;
      mario.paranoiaCountdown = 0;
      mario.doubleJumpCountdown = 0;
      mario.invincibilityCountdown = 0;
    }
    if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 570 && mouseY <= 670){
      mario.dead = false;
      inMenu = true;
      menu = 0;
      mario.lives = 3;
      mario.paranoiaCountdown = 0;
      mario.doubleJumpCountdown = 0;
      mario.invincibilityCountdown = 0;
    }
  }
    if (levelCompleted && level == 0){
    if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 450 && mouseY <= 550){
      mario.lives = 3;
      level++;
      mario.dead = false;
      levelCompleted = false;
      mario.paranoiaCountdown = 0;
      mario.doubleJumpCountdown = 0;
      mario.invincibilityCountdown = 0;
    }
    if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 570 && mouseY <= 670){
      mario.dead = false;
      levelCompleted = false;
      inMenu = true;
      menu = 0;
      mario.lives = 3;
      mario.paranoiaCountdown = 0;
      mario.doubleJumpCountdown = 0;
      mario.invincibilityCountdown = 0;
    }
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
      scale(2);
      image(menuLockerText, 340, 10);
      scale(0.5);
      image(currentSkin, 300, 300);
      fill(0);
      textFont(marioFont);
      textSize(50);
      text("Unlock new skins by scoring higher in infinite mode", 400, 180);
    }
      
  }
    
  if (!(inMenu)){
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
      if (tutorial.get(i).x < 1920){
        tutorial.get(i).display();
        if (mario.invincibilityCountdown == 0){
          tutorial.get(i).check();
        }
      }
    }
    if (mario.dead){
      fill(0);
      stroke(255, 0, 0);
      strokeWeight(3);
      rect(600, 300, 720, 480);
      fill(255, 0, 0);
      text("You died!", 815, 400);
      fill(255);
      rect(748, 450, 420, 100);
      fill (0);
      if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 450 && mouseY <= 550){
        fill(255);
      }
      rect(758, 460, 400, 80);
      fill(255, 0, 0);
      textSize(50);
      text("Retry", 885, 515);
      
      fill(255);
      rect(748, 570, 420, 100);
      fill (0);
      if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 570 && mouseY <= 670){
        fill(255);
      }
      rect(758, 580, 400, 80);
      fill(255, 0, 0);
      fill(255, 0, 0);
      text("Main Menu", 840, 635);
    }
    if (levelCompleted){
    fill(0);
      stroke(0,255,0);
      strokeWeight(6);
      rect(600, 300, 720, 480);
      fill(0, 255, 0);
      text("You win!", 830, 400);
      fill(0);
      rect(748, 450, 420, 100);
      fill (0);
      if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 450 && mouseY <= 550){
        fill(255);
      }
      rect(758, 460, 400, 80);
      fill(0, 255, 0);
      textSize(50);
      text("Next level", 845, 515);
      
      fill(0);
      rect(748, 570, 420, 100);
      fill (0);
      if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 570 && mouseY <= 670){
        fill(255);
      }
      rect(758, 580, 400, 80);
      fill(0, 255, 0);
      text("Main Menu", 845, 635);
      fill(0);
    }


    else{
      if (keys[0] && !(mario.dead) && !(levelCompleted)){
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
      
  }
  if (keys[0] && !(mario.dead) && !(levelCompleted)){
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
