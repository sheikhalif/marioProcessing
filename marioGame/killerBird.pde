public class killerBird extends Environment{
  int x;
  int y;
  int centerY = 200;
  int attackX;
  int attackY;
  boolean stabilizeMode = true;
  boolean movementMode = true; //true = right to left , false = left to right
  boolean flapMode = true; //true = top to bottom, false = bottom to top
  boolean attackMode = false;
  int countdown = 760;
  boolean hit = false;
  color c = color(0, 0, 0);
  public killerBird(int x__){
    x = x__;
    y = 170;
  }
  
  void display(){
    if (x < 1920){
      if (countdown > 0)countdown--;
    if (countdown == 0)attackMode = true;
    strokeWeight(20);
    stroke(c);
    line (x, centerY, x-40, y);
    line (x, centerY, x+40, y);
    if (attackMode == false){
      changeY();
      move();
    }
    else if (attackMode == true){
      c = color(255, 0, 0);
      if (y > 170 && stabilizeMode){
        y-=2;
      }
      else{
        stabilizeMode = false;
        if (y <= 170){
          attackX = x;
          attackY = y;
        }
        attack();
        if (mario.invincibilityCountdown == 0){
          check();
        }
      }
    }
    
    }
      
    noStroke();
    
  }
  
  void check(){
    if (!(hit) && x < 240 && mario.yval+300 < centerY && mario.yval+300 > y){
      mario.damage();
      hit = true;
    }
  }
    
  
  void attack(){
    int incrementX = (attackX + 200) / 60;
    int incrementY = (860 - attackY) / 50;
    x-=incrementX;
    centerY+=incrementY;
    y += incrementY;
  }
    
    
  
  void changeY(){
    if (flapMode){
      y+=2;
      if (y >= 230){
        flapMode = false;
      }
    }
    else if (!(flapMode)){
      y-=2;
      if (y <= 170){
        flapMode = true;
      }
    }
  }
  
  void move(){
    if (x > 1980){
      x-=speed;
    }
    else{
      if (movementMode){
        x-=4;
        if (x <= 20)movementMode=false;
      }
      else if (!(movementMode)){
        x+=2;
        if (x>=1900)movementMode=true;
    }
    
  }
}
}
    
