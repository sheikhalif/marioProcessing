public class Character{
  PImage skin;
  int speed = 15;
  int jumpForce=20;
  int yval = 600;
  int yvalChange = 10;
  boolean jump = false;
  int lives = 3;
  color c;
  boolean trapped = false;
  int paranoiaCountdown = 0;
  
 
  public Character(){
  }
 
  void move(){
    if (jump){
      if (yval < 350){
        jump = false;
      }
      yval*=0.93;
    }
    if (!(trapped) && yval < 600){
      yval*=1.02;
      if (yval > 600)yval=600;
    }
  }
      
 
  void display(){
    fill(c);
    rect(100, yval, 100, 300);
    image(marioSkin1, 100, yval);
    c = color(0, 0, 0);
  }
 
  void jump(){
    if (yval >= 600)jump = true;
  }
  
  void damage(){
    lives--;
    c = color(255, 0, 0);
  }
}
