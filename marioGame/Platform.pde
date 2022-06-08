public class Platform extends backgroundItems{
  PImage skin;
  int x;
  
  public Platform(){
    x = 0;
  }
 
  public Platform(int x__){
    x=x__;
  }
 
  void display(){
    fill(0, 255, 0);
    rect(x, 900, 1920, 180);
    image(platformSkin, x, 900);
  }
  
  void move(){
    x-=speed;
  }
}
