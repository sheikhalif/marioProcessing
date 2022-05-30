public class killerBird extends Environment{
  int x;
  int y;
  boolean movementMode = true; //true = right to left , false = left to right
  boolean flapMode = true; //true = top to bottom, false = bottom to top
  public killerBird(){
    x = 1000;
    y = 170;
  }
  
  void display(){
    strokeWeight(20);
    stroke(0);
    line (x, 200, x-40, y);
    line (x, 200, x+40, y);
    changeY();
    move();
    noStroke();
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
    
