public class spikedBall extends Environment{
  PImage skin;
  boolean hit = false;
 
  public spikedBall(int x__){
  x = x__;
  }
 
  void display(){
    noStroke();
    fill(0);
    square(x+50, 800, 100);
    fill(100);
    triangle(x+50, 900, x, 887, x+50, 874);
    triangle(x+50, 874, x, 862, x+50, 850);
    triangle(x+50, 850, x, 837, x+50, 824);
    triangle(x+50, 824, x, 812, x+50, 800);
    triangle(x+50, 800, x+63, 750, x+76, 800);
    triangle(x+76, 800, x+88, 750, x+100, 800);
    triangle(x+100, 800, x+113, 750, x+126, 800);
    triangle(x+126, 800, x+138, 750, x+150, 800);
    triangle(x+150, 900, x+200, 887, x+150, 874);
    triangle(x+150, 874, x+200, 862, x+150, 850);
    triangle(x+150, 850, x+200, 837, x+150, 824);
    triangle(x+150, 824, x+200, 812, x+150, 800);
    if (checkInFront()){
      x-=5;
    }
  }
 
  void move(){
    x-=speed;
  }
 
  void check(){
    if (!(hit)){
      if (x < 200 && x > -100){
        if (mario.yval+300 > 800){
          mario.damage();
          hit = true;
        }
        if (x < 140 && x > -30){
          if (mario.yval+300 > 750 && mario.yval+300 < 800){
            mario.damage();
            hit = true;
          }
        }
      }
    }      
  }
  
  
 
  boolean checkInFront(){
    if (level == 0){
      for (int i = 0; i < currentLevel.size(); i++){
        if (currentLevel.get(i).getX() > 0 && currentLevel.get(i).getX() < x){
          return false;
        }
      }
      return true;
    }
    return true;
  }
}
