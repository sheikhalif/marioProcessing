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
      if (200 > x && mario.yval+300 > 800){
        println("Mario height: " + (900-mario.yval-300));
        if (900-mario.yval+300 <= heightAtPoint(200)){
          println("hit");
          mario.damage();
          hit = true;
        }
      }
    }
  }
  
  float heightAtPoint(int xPos){
    if (xPos >= x && xPos < x+45){
      println((xPos-x) * (20/9));
      return ((xPos-x) * (20/9));
    }
    if (xPos >= x+45 && xPos <= x+145){
      println(100);
      return 100;
    }
    if (xPos > x+145 && xPos <= x+190){
      println((xPos-x)*(-20/9) + 100);
      return ((xPos-x)*(-20/9) + 100);
    }
    return 0;
  }
}
