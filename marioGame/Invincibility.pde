public class Invincibility extends Powerups{
  int x;
  boolean hit = false;
  public Invincibility(int x__){
    x = x__;
  }
  
  void display(){
    if (!(hit)){
      noStroke();
      fill(85, 171, 234);
      circle(x, 500, 100);
    }
  }
  
  void move(){
    x-=speed;
  }
  
  void check(){
    if (!(hit) && x < 250 && x > 150 && mario.yval > 150 && mario.yval < 550){
      mario.invincibilityCountdown = 600;
      hit = true;
      speed = 50;
    }
  }
}
