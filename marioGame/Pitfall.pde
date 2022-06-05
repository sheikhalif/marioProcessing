public class Pitfall extends Traps{
  int x;
  public Pitfall(int x__){
    x = x__;
  }
  
  void display(){
    fill(255);
    rect(x, 900, 400, 1080);
    fill(0);
    stroke(0);
    strokeWeight(8);
    line(x, 900, x, 1080);
    line(x+400, 900, x+400, 1080);
    if (mario.invincibilityCountdown == 0){
      check();
    }
  }
  
  void move(){
    x-=speed;
  }
  
  void check(){
    if (x < 100 && x > -200 && (mario.yval+300)>=880){
      mario.trapped = true;
      keys[0] = false;
      mario.yval*=1.02;
      mario.lives = 0;
    }
  }
}
