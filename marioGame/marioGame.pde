import java.util.*;

Character mario = new Character();
Platform grassPlatform = new Platform();
int speed = mario.speed;
ArrayList<Environment> obstacles = new ArrayList<Environment>();
boolean[] keys = new boolean[]{false, false};


void setup(){
  size(1920, 1080);
  Spike spike1 = new Spike(600);
  obstacles.add(spike1);
  spikedBall spikedBall1 = new spikedBall(1300);
  obstacles.add(spikedBall1);
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
  String lives = "Lives: " + mario.lives;
  mario.display();
  mario.move();
  grassPlatform.display();
  for(int i = 0; i < obstacles.size(); i++){
    obstacles.get(i).display();
    obstacles.get(i).check();
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
  }
  if (keys[1]){
    for (int i = 0; i < obstacles.size(); i++){
      Environment currentObstacle = obstacles.get(i);
      if (currentObstacle.x < -90){
        obstacles.remove(currentObstacle);
      }
      else{
        currentObstacle.moveOpposite();
      }
    }
  }
  fill(0);
  textSize(50);
  text (lives, 20, 50);
}
