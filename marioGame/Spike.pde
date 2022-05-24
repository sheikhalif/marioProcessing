public class Spike{
  PImage skin;
  int x;
  
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
}
    
    
