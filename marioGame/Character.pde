public class Character{
  PImage skin;
  int speed;
  int jumpForce=20;
  int yval = 600;
  int yvalChange = 10;
  boolean jump = false;
  int lives = 3;
 
  public Character(){
    speed = 10;
  }
 
  void move(){
    if (jump){
      if (yval < 400){
        jump = false;
      }
      yval*=0.95;
    }
    if (yval < 600){
      yval*=1.02;
      if (yval > 600)yval=600;
    }
  }
      
 
  void display(){
    background(255);
    fill(0);
    rect(100, yval, 100, 300);
  }
 
  void jump(){
    if (yval >= 600)jump = true;
  }
  
  void damage(){
    lives--;
  }
}
