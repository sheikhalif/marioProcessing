public class Spike extends Environment{
  PImage skin;
  int x;
  boolean hit = false;
 
  public Spike(int x__){
    x = x__;
  }
 
  void display(){
    fill(150);
    triangle(x, 900, x+45, 800, x+90, 900);
  }
 
  void move(){
    x-=speed;
  }
  
  void check(){
    if (!(hit)){
      if (200 > x && 200 < x+190 && mario.yval > 800){
        if (900-mario.yval < heightAtPoint(x)){
          mario.damage();
          hit = true;
        }
      }
    }
  }
  
  float heightAtPoint(int xPos){
    if (xPos >= x && xPos < x+45){
      return ((xPos-x) * (20/9));
    }
    if (xPos >= x+45 && xPos <= x+145){
      return 100;
    }
    if (xPos > x+145 && xPos <= x+190){
      return ((xPos-x)*(-20/9) + 100);
    }
    return 0;
  }
}
