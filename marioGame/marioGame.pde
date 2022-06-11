/**
Cheat Codes:

k (in game) : Level finished menu
l (in game) : invincibility on/off
k (in menu) : unlock all skins
j (in game) : death screen

**/




import java.util.*;
import java.lang.*;

Character mario = new Character();
PFont marioFont;
Platform grassPlatform = new Platform();
int speed = mario.speed;
ArrayList<Environment> currentLevel = new ArrayList<Environment>();
ArrayList<backgroundItems> backgroundObjects = new ArrayList<backgroundItems>();
int backgroundObjectStartX = 600;
float scale = 1;
boolean inMenu = true;
int menu = 0;  
int level = -1;
boolean levelCompleted = false;
boolean tutorialCompleted = false;
boolean firstLevelCompleted = false;
boolean secondLevelCompleted = false;
color hoverColor = color(0, 0, 0);
PImage marioSkin1;
PImage marioSkin1damage;
PImage marioSkin1doubleJump;
PImage marioSkin1invincibility;
PImage marioSkin2damage;
PImage marioSkin2doubleJump;
PImage marioSkin2invincibility;
PImage marioSkin3damage;
PImage marioSkin3doubleJump;
PImage marioSkin3invincibility;
PImage marioSkin4damage;
PImage marioSkin4doubleJump;
PImage marioSkin4invincibility;
PImage marioSkin2;
PImage marioSkin3;
PImage marioSkin4;
PImage marioMenuText;
PImage menuTutorialText;
PImage menuLevel1Text;
PImage menuLevel2Text;
PImage menuLockerText;
PImage platformSkin;
PImage currentSkin;
PImage currentSkinDamage;
PImage currentSkinDoubleJump;
PImage currentSkinInvincibility;
PImage mainMenuText;
color lockerHoverColor = color(207, 233, 250);
  
Background theBackground = new Background();
boolean[] keys = new boolean[]{false, false};


void setup(){
  size(1920,1080);
  marioFont = createFont("super_mario_rpg_font.ttf", 150);
  marioSkin1 = loadImage("marioskin1.png");
  marioSkin1damage = loadImage("marioskin1damage.png");
  marioSkin1doubleJump = loadImage("marioskin1doublejump.png");
  marioSkin1invincibility = loadImage("marioskin1invincibility.png");
  marioSkin2 = loadImage("marioskin3.png");
  marioSkin2damage = loadImage("marioskin3damage.png");
  marioSkin2doubleJump = loadImage("marioskin3doublejump.png");
  marioSkin2invincibility = loadImage("marioskin3invincibility.png");
  marioSkin3 = loadImage("marioskin2.png");
  marioSkin3damage = loadImage("marioskin2damage.png");
  marioSkin3doubleJump = loadImage("marioskin2doublejump.png");
  marioSkin3invincibility = loadImage("marioskin2invincibility.png");
  marioSkin4 = loadImage("marioskin4.png");
  marioSkin4damage = loadImage("marioskin4damage.png");
  marioSkin4doubleJump = loadImage("marioskin4doublejump.png");
  marioSkin4invincibility = loadImage("marioskin4invincibility.png");
  marioMenuText = loadImage("mariomenutext.png");
  menuTutorialText = loadImage("menututorial.png");
  menuLevel1Text = loadImage("menulevel1.png");
  menuLevel2Text = loadImage("menulevel2.png");
  menuLockerText = loadImage("menulocker.png");
  platformSkin = loadImage("mariobrickplatform.png");
  mainMenuText = loadImage("mainmenutext.png");
  currentSkin = marioSkin1;
  currentSkinDamage = marioSkin1damage;
  currentSkinDoubleJump = marioSkin1doubleJump;
  currentSkinInvincibility = marioSkin1invincibility;
  }
  
void setBackground(){
  backgroundObjects.clear();
  backgroundObjectStartX = 300;
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
  currentLevel.clear();
  currentLevel.add(new tutorialText(300, "Welcome to Mario! Move using 'd' and jump using 'space'"));
  currentLevel.add(new Spike(1200));
  currentLevel.add(new Spike(1800));
  currentLevel.add(new tutorialText(2900, "There are three types of obstacles in this game: "));
  currentLevel.add(new tutorialText(5090, "Spikes"));
  currentLevel.add(new Spike(5120));
  currentLevel.add(new tutorialText(6000, "Spiked Balls"));
  currentLevel.add(new spikedBall(7000));
  currentLevel.add(new tutorialText(7500, "and Killer Birds. Watch out!"));
  currentLevel.add(new killerBird(2000));
  currentLevel.add(new tutorialText(14000, "There are two types of traps:"));
  currentLevel.add(new tutorialText(15500, "Poison Traps. Jump on it to see what happens!"));
  currentLevel.add(new poisonTrap(16800));
  currentLevel.add(new Spike(17700));
  currentLevel.add(new Spike(18200));
  currentLevel.add(new spikedBall(19400));
  currentLevel.add(new Spike(19900));
  currentLevel.add(new Spike(20500));
  currentLevel.add(new Spike(21000));
  currentLevel.add(new tutorialText(22800, "and Pitfalls. Don't jump!"));
  currentLevel.add(new Pitfall(23800));
  currentLevel.add(new tutorialText(24800, "Lastly, there are two power-ups:"));
  currentLevel.add(new tutorialText(26000, "Double Jump"));
  currentLevel.add(new doubleJump(27000));
  currentLevel.add(new Spike(27700));
  currentLevel.add(new Spike(27800));
  currentLevel.add(new Spike(27900));
  currentLevel.add(new Spike(28000));
  currentLevel.add(new Spike(28100));
  currentLevel.add(new Spike(28200));
  currentLevel.add(new Spike(28300));
  currentLevel.add(new spikedBall(28900));
  currentLevel.add(new spikedBall(29100));
  currentLevel.add(new spikedBall(29300));
  currentLevel.add(new killerBird(24000));
  currentLevel.add(new killerBird (24100));
  currentLevel.add(new killerBird(24200));
  currentLevel.add(new killerBird(24300));
  currentLevel.add(new killerBird(24400));
  currentLevel.add(new tutorialText(37500, "and invincibility. Run!!"));
  currentLevel.add(new Invincibility(38900));
  for (int i = 0; i < 170; i++){
    currentLevel.add(new Spike(39400+(100*i)));
  }
  currentLevel.add(new tutorialText(57500, "And that's the game! Check out the locker to unlock new skins for Mario!"));
  currentLevel.add(new Flag(60000));
}

void setLevel1(){
  currentLevel.clear();
  currentLevel.add(new Spike(400));
  currentLevel.add(new Spike(600));
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
  if (keyCode == 75 && menu==1){
    tutorialCompleted = true;
    firstLevelCompleted = true;
    secondLevelCompleted = true;
  }
  if (keyCode == 76 && !(inMenu)){
    if (mario.invincibilityCountdown == 0){
      mario.invincibilityCountdown = 99999999;
      speed = 100;
    }
    else{
      mario.invincibilityCountdown = 0;
      speed = 15;
    }
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
    setBackground();
    }
    if (mouseX >= 500 && mouseX <= 920 && mouseY >= 530 && mouseY <= 630){
      inMenu = false;
      level = 1;
      setLevel1();
      setBackground();
    }
    if (mouseX >= 500 && mouseX <= 920 && mouseY >= 650 && mouseY <= 750){
      inMenu = false;
      level = 2;
    }
    if (mouseX >= 500 && mouseX <= 920 && mouseY >= 770 && mouseY <= 870){
      menu = 1;
    }
  }
  if (mario.dead){
    if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 450 && mouseY <= 550){
      if (level == 0){
        setTutorial();
      }
      else if (level == 1){
        setLevel1();
      }   
      setBackground();
      mario.yval = 600;
      mario.trapped = false;
      mario.lives = 3;
      mario.dead = false;
      speed = 15;
      mario.paranoiaCountdown = 0;
      mario.doubleJumpCountdown = 0;
      mario.invincibilityCountdown = 0;
    }
    if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 570 && mouseY <= 670){
      mario.dead = false;
      inMenu = true;
      menu = 0;
      mario.lives = 3;
      mario.yval = 600;
      speed = 15;
      mario.trapped = false;
      mario.paranoiaCountdown = 0;
      mario.doubleJumpCountdown = 0;
      mario.invincibilityCountdown = 0;
    }
  }
    if (levelCompleted && level != 2){
    if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 450 && mouseY <= 550){
      mario.lives = 3;
      level++;
      setBackground();
      mario.dead = false;
      speed = 15;
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
      speed = 15;
      mario.paranoiaCountdown = 0;
      mario.doubleJumpCountdown = 0;
      mario.invincibilityCountdown = 0;
    }
  }
  if (menu == 1){
    if (mouseX >= 740 && mouseX <= 1180 && mouseY >= 780 && mouseY <= 880){
      menu = 0;
    }
    if (mouseX >= 190 && mouseX <= 336 && mouseY >= 220 && mouseY <= 640){
      currentSkin = marioSkin1;
      currentSkinDamage = marioSkin1damage;
      currentSkinDoubleJump = marioSkin1doubleJump;
      currentSkinInvincibility = marioSkin1invincibility;
    }
    
    if (mouseX >= 670 && mouseX <= 816 && mouseY >= 220 && mouseY <= 640 && tutorialCompleted){
      currentSkin = marioSkin2;
      currentSkinDamage = marioSkin2damage;
      currentSkinDoubleJump = marioSkin2doubleJump;
      currentSkinInvincibility = marioSkin2invincibility;
    }
    
    if (mouseX >= 1120 && mouseX <= 1266 && mouseY >= 220 && mouseY <= 640 && firstLevelCompleted){
      currentSkin = marioSkin3;
      currentSkinDamage = marioSkin3damage;
      currentSkinDoubleJump = marioSkin3doubleJump;
      currentSkinInvincibility = marioSkin3invincibility;
    }
    
    if (mouseX >= 1566 && mouseX <= 1708 && mouseY >= 220 && mouseY <= 640 && secondLevelCompleted){
      currentSkin = marioSkin4;
      currentSkinDamage = marioSkin4damage;
      currentSkinDoubleJump = marioSkin4doubleJump;
      currentSkinInvincibility = marioSkin4invincibility;
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
      fill(0);
      textFont(marioFont);
      textSize(50);
      scale(2);
      image(menuLockerText, 340, 10);
      scale(0.7);
            fill(207, 233, 250);
      if ((mouseX >= 190 && mouseX <= 336 && mouseY >= 220 && mouseY <= 640) || currentSkin == marioSkin1){
        fill(255);
        stroke(0);
        strokeWeight(3);
      }
      rect(130, 150, 120, 320);
      image(marioSkin1, 140, 160);
      
      noStroke();
      fill(207, 233, 250);
      if ((mouseX >= 670 && mouseX <= 816 && mouseY >= 220 && mouseY <= 640 && tutorialCompleted) || currentSkin == marioSkin2){
        fill(255);
        stroke(0);
        strokeWeight(3);
      }
      rect(470, 150, 120, 320);
      image(marioSkin2, 480, 160);
      if (!(tutorialCompleted)){
        fill(0);
        rect(480, 160, 100, 300);
        fill(255);
        text("?", 515, 290);
      }
      
      noStroke();
      fill(207, 233, 250);
      if ((mouseX >= 1120 && mouseX <= 1266 && mouseY >= 220 && mouseY <= 640 && firstLevelCompleted) || currentSkin == marioSkin3){
        fill(255);
        stroke(0);
        strokeWeight(3);
      }
      rect(790, 150, 120, 320);
      image(marioSkin3, 800, 160);
      if (!(firstLevelCompleted)){
        fill(0);
        rect(800, 160, 100, 300);
        fill(255);
        text("?", 835, 290);
      }
      
      noStroke();
      fill(207, 233, 250);
      if ((mouseX >= 1566 && mouseX <= 1708 && mouseY >= 220 && mouseY <= 640 && secondLevelCompleted) || currentSkin == marioSkin4){
        fill(255);
        stroke(0);
        strokeWeight(3);
      }
      rect(1110, 150, 120, 320);
      image(marioSkin4, 1120, 160);
      if (!(secondLevelCompleted)){
        fill(0);
        rect(1120, 160, 100, 300);
        fill(255);
        text("?", 1155, 290);
      }
      noStroke();
     
      fill(255, 0, 0);
      textSize(30);
      text("Mario", 150, 500);
      if (tutorialCompleted){
        fill(#323E29);
        text("GI Mario", 472, 500);
      }
      else{
        fill(0);
        text("Complete tutorial", 410, 500);
      }
      
      
      if (firstLevelCompleted){
        fill(#FFD700);
        text("Bling Bling Mario", 740, 500);
      }
      else{
        fill(0);
        text("Complete level 1", 740, 500);
      }
      if (secondLevelCompleted){
        fill(0);
        text("Mr. K", 1134, 500);
      }
      else{
        fill(0);
        text("Complete level 2", 1060, 500);
      }
      scale(0.71);
      if (mouseX >= 740 && mouseX <= 1180 && mouseY >= 780 && mouseY <= 880){
        fill(255);
        stroke(0);
        strokeWeight(3);
        rect(730, 770, 460, 120);
        noStroke();
      }
      
      fill(0);
      rect(740, 780, 440, 100);
      fill (141, 79, 58);
      rect(750, 790, 420, 80);
      image(mainMenuText, 760, 805);
      
      
      
    }
      
  }
    
  if (!(inMenu)){
    textFont(marioFont);
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
    image(currentSkinDoubleJump, 100, mario.yval);
    mario.doubleJumpCountdown--;
  }
  if (mario.invincibilityCountdown > 0){
    image(currentSkinInvincibility, 100, mario.yval);
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
  if (mario.doubleJumpCountdown > 0){
    image(currentSkinDoubleJump, 100, mario.yval);
  }
  if (mario.invincibilityCountdown > 0){
    image(currentSkinInvincibility, 100, mario.yval);
  }
  mario.move();
    for(int i = 0; i < currentLevel.size(); i++){
      if (currentLevel.get(i).x < 1920){
        currentLevel.get(i).display();
        if (mario.invincibilityCountdown == 0){
          currentLevel.get(i).check();
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
      textSize(80);
      text("You win!", 800, 400);
      fill(0);
      rect(748, 450, 420, 100);
      fill (0);
      if (level == 2){
        if (mouseX >= 748 && mouseX <= 1168 && mouseY >= 570 && mouseY <= 670){
          fill(255);
        }
        rect(758, 600, 400, 80);
        fill(0, 255, 0);
        text("Main Menu", 845, 655);
      }
      else{
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
      if (level == 0){
        tutorialCompleted = true;
      }
      if (level == 1){
        firstLevelCompleted = true;
      }
      if (level == 2){
        secondLevelCompleted = true;
      }
      }
      
    }


    else{
      if (keys[0] && !(mario.dead) && !(levelCompleted)){
      for (int i = 0; i < currentLevel.size(); i++){
        if (currentLevel.get(i).x < -150){
          currentLevel.remove(currentLevel.get(i));
        }
        else{
          currentLevel.get(i).move();
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
