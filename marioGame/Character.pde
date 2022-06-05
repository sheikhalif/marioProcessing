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
  int doubleJumpCountdown = 0;
  int invincibilityCountdown = 0;
  boolean doubleJump = false;
  int jumpStart = 0;

 
  public Character(){
  }
 
  void move(){
    if (doubleJump){
      if (jump){
        if (yval < 350){
          jump = false;
        }
        yval*=0.93;
      }
      else if(jumpStart < 600){
        if (yval < jumpStart-250){
          doubleJump = false;
        }
        yval*=0.93;
      }
    }

    else if (jump){
      if (yval < 350){
        jump = false;
      }
      yval*=0.93;
    }
    if (!(trapped) && yval < 600){
      yval*=1.02;
      if (yval > 600)yval=600;
      if (yval < 350){
        yval*=1.02;
      }
    }
  }
      
 
  void display(){
    fill(c);
    rect(100, yval, 100, 300);
    image(marioSkin1, 100, yval);
    c = color(0, 0, 0);
  }
 
  void jump(){
    if (yval >= 600 && doubleJumpCountdown > 0){
      jump = true;
      doubleJump = true;
    }
    else if (yval >= 600)jump = true;
  }
    
  
  void damage(){
    lives--;
    c = color(255, 0, 0);
  }
}
