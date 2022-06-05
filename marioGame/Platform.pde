public class Platform extends backgroundItems{
  PImage skin;
 
  public Platform(){}
 
  void display(){
    fill(0, 255, 0);
    rect(0, 900, 1920, 180);
    image(platformSkin, 0, 900);
  }
}
