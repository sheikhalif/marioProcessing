public class doubleJump extends Powerups{
  int x;
  boolean hit;
  
  public doubleJump(int x__){
    x = x__;
  }
  
  void display(){
    if (!(hit)){
      fill(154, 70, 224);
      circle(x, 500, 100);
    }
  }
  
  void move(){
    x-=speed;
  }
  
  void check(){
    if (!(hit) && x < 250 && x > 150 && mario.yval > 150 && mario.yval < 550){
      mario.doubleJumpCountdown = 600;
      hit = true;
    }
  }
}
      
    
